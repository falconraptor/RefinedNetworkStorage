ID = {
    thisEntity = nil,
    entID = nil,
    networkController = nil,
    maxStorage = 0,
    storage = nil,
    connectedObjs = nil,
    cardinals = nil,
    updateTick = 60,
    lastUpdate = 0,
}

function ID:new(object)
    if object == nil then return end
    local t = {}
    local mt = {}
    setmetatable(t, mt)
    mt.__index = ID
    t.thisEntity = object
    t.entID = object.unit_number
    if object.name == Constants.Drives.ItemDrive.ItemDrive1k.name then
        t.maxStorage = Constants.Drives.ItemDrive.ItemDrive1k.max_size
    elseif object.name == Constants.Drives.ItemDrive.ItemDrive4k.name then
        t.maxStorage = Constants.Drives.ItemDrive.ItemDrive4k.max_size
    elseif object.name == Constants.Drives.ItemDrive.ItemDrive16k.name then
        t.maxStorage = Constants.Drives.ItemDrive.ItemDrive16k.max_size
    elseif object.name == Constants.Drives.ItemDrive.ItemDrive64k.name then
        t.maxStorage = Constants.Drives.ItemDrive.ItemDrive64k.max_size
    end
    t.storage = game.create_inventory(t.maxStorage)
    t.cardinals = {
        [1] = false, --N
        [2] = false, --E
        [3] = false, --S
        [4] = false, --W
    }
    t.connectedObjs = {
        [1] = {}, --N
        [2] = {}, --E
        [3] = {}, --S
        [4] = {}, --W
    }
    t:collect()
    UpdateSys.addEntity(t)
    return t
end

function ID:rebuild(object)
    if object == nil then return end
    local mt = {}
    mt.__index = ID
    setmetatable(object, mt)
end

function ID:remove()
    UpdateSys.remove(self)
    if self.networkController ~= nil then
        self.networkController.network.ItemDriveTable[self.entID] = nil
        self.networkController.network.shouldRefresh = true
    end
end

function ID:valid()
    return self.thisEntity ~= nil and self.thisEntity.valid == true
end

function ID:update()
    self.lastUpdate = game.tick
    if valid(self) == false then
        self:remove()
        return
    end
    if valid(self.networkController) == false then
        self.networkController = nil
    end
    if self.thisEntity.to_be_deconstructed() == true then return end
    self:collect()
end

function ID:resetCollection()
    self.connectedObjs = {
        [1] = {}, --N
        [2] = {}, --E
        [3] = {}, --S
        [4] = {}, --W
    }
end

function ID:getCheckArea()
    local x = self.thisEntity.position.x
    local y = self.thisEntity.position.y
    return {
        [1] = {direction = 1, startP = {x-1.0, y-2.0}, endP = {x+1.0, y-1.0}}, --North
        [2] = {direction = 2, startP = {x+1.0, y-1.0}, endP = {x+2.0, y+1.0}}, --East
        [4] = {direction = 4, startP = {x-1.0, y+1.0}, endP = {x+1.0, y+2.0}}, --South
        [3] = {direction = 3, startP = {x-2.0, y-1.0}, endP = {x-1.0, y+1.0}}, --West
    }
end

function ID:collect()
    local areas = self:getCheckArea()
    self:resetCollection()
    for _, area in pairs(areas) do
        local enti = 0
        local ents = self.thisEntity.surface.find_entities_filtered{area={area.startP, area.endP}}
        for _, ent in pairs(ents) do
            if ent ~= nil and ent.valid == true and string.match(ent.name, "RNS_") ~= nil and global.entityTable[ent.unit_number] ~= nil and ent.operable then
                local obj = global.entityTable[ent.unit_number]
                if string.match(obj.thisEntity.name, "RNS_NetworkCableIO") ~= nil and obj:getConnectionDirection() == area.direction then
                    --Do nothing
                else
                    table.insert(self.connectedObjs[area.direction], obj)
                    enti = enti + 1

                    if self.cardinals[area.direction] == false then
                        self.cardinals[area.direction] = true
                        if valid(self.networkController) == true and self.networkController.thisEntity ~= nil and self.networkController.thisEntity.valid == true then
                            self.networkController.network.shouldRefresh = true
                        elseif obj.thisEntity.name == Constants.NetworkController.slateEntity.name then
                            obj.network.shouldRefresh = true
                        end
                    end
                end
            end
        end
        if self.cardinals[area.direction] == true and enti == 0 then
            self.cardinals[area.direction] = false
            if valid(self.networkController) == true and self.networkController.thisEntity ~= nil and self.networkController.thisEntity.valid == true then
                self.networkController.network.shouldRefresh = true
            end
        end
    end
end

function ID:validate()

end

function ID:has_item(itemstack_data, metadataMode)
    local amount = 0
    local inv = self.storage
    for i = 1, #inv do
        local itemstack = inv[i]
        if itemstack.count <= 0 then goto continue end
        local itemstackC = Util.itemstack_convert(itemstack)
        if Util.itemstack_matches(itemstack_data, itemstackC, metadataMode) then
            if game.item_prototypes[itemstack_data.cont.name] == game.item_prototypes[itemstackC.cont.name] then
                if itemstack_data.cont.ammo and itemstackC.cont.ammo and itemstack_data.cont.ammo < game.item_prototypes[itemstackC.cont.name].magazine_size then
                    amount = amount + 1
                    goto continue
                end
                if itemstack_data.cont.durability and itemstackC.cont.durability and itemstack_data.cont.durability < game.item_prototypes[itemstackC.cont.name].durability then
                    amount = amount + 1
                    goto continue
                end
            end
            amount = amount + itemstack.count
        elseif game.item_prototypes[itemstack_data.cont.name] == game.item_prototypes[itemstackC.cont.name] then
            if itemstack_data.cont.ammo and itemstackC.cont.ammo and itemstack_data.cont.ammo > itemstackC.cont.ammo and itemstackC.cont.count > 1 then
                amount = amount + itemstack.count - 1
            end
            if itemstack_data.cont.durability and itemstackC.cont.durability and itemstack_data.cont.durability > itemstackC.cont.durability and itemstackC.cont.count > 1 then
                amount = amount + itemstack.count - 1
            end
        end
        ::continue::
    end
    return amount
end

function ID:has_empty_slot()
    for i = 1, #self.storage do
        if self.storage[i].count <= 0 then return true end
    end
    return false
end

function ID:has_room()
    if self:getRemainingStorageSize() > 0 then return true end
    return false
end

function ID:get_inventory()
    local contents = {}
    local inv = self.storage
    for i = 1, #inv do
        local itemstack = inv[i]
        if itemstack.count <= 0 then goto continue end
        Util.add_or_merge(itemstack, contents)
        ::continue::
    end
    return contents
end

function ID:getStorageSize()
    local count = 0
    for i = 1, #self.storage do
        count = count + self.storage[i].count
    end
    return count
end

function ID:getRemainingStorageSize()
    return self.maxStorage - self:getStorageSize()
end

function ID:DataConvert_ItemToEntity(id)
    local inv = global.tempInventoryTable[id].storage
    for i = 1, #inv do
        if inv[i].count <= 0 then goto continue end
        self.storage[i].transfer_stack(inv[i])
        ::continue::
    end
    global.tempInventoryTable[id] = nil
end

function ID:DataConvert_EntityToItem(item)
    if self.storage ~= nil then
        local size = self:getStorageSize()
        if size == 0 then return end
        local storage = game.create_inventory(self.maxStorage)
        for i = 1, #self.storage do
            if self.storage[i].count <= 0 then goto continue end
            storage[i].transfer_stack(self.storage[i])
            ::continue::
        end
        global.tempInventoryTable[item.item_number] = {itemstack=item, storage=storage}
        item.set_tag(Constants.Settings.RNS_Tag, item.item_number)
        item.custom_description = {"", item.prototype.localised_description, {"item-description.RNS_ItemDriveTag", size, self.maxStorage}}
    end
end

function ID:getTooltips(guiTable, mainFrame, justCreated)
    if justCreated == true then
        guiTable.vars.Gui_Title.caption = {"gui-description.RNS_ItemDrive_Title"}
        local infoFrame = GuiApi.add_frame(guiTable, "InformationFrame", mainFrame, "vertical", true)
		infoFrame.style = Constants.Settings.RNS_Gui.frame_1
		infoFrame.style.vertically_stretchable = true
		infoFrame.style.minimal_width = 200
		infoFrame.style.left_margin = 3
		infoFrame.style.left_padding = 3
		infoFrame.style.right_padding = 3
		GuiApi.add_subtitle(guiTable, "", infoFrame, {"gui-description.RNS_Information"})
        GuiApi.add_label(guiTable, "Capacity", infoFrame, {"gui-description.RNS_ItemDrive_Capacity", self:getStorageSize(), self.maxStorage}, Constants.Settings.RNS_Gui.orange, nil, true)
    end
    local capacity = guiTable.vars.Capacity
    capacity.caption = {"gui-description.RNS_ItemDrive_Capacity", self:getStorageSize(), self.maxStorage}
end