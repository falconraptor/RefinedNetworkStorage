--NetworkController object
NC = {
    thisEntity = nil,
    entID = nil,
    updateTick = 600,
    lastUpdate = 0,
    stable = false,
    state = nil,
    network = nil,
    connectedObjs = nil
}
--Constructor
function NC:new(object)
    if object == nil then return end
    local t = {}
    local mt = {}
    setmetatable(t, mt)
    mt.__index = NC
    t.thisEntity = object
    t.entID = object.unit_number
    t.network = t.network or BaseNet:new()
    t.network.networkController = t
    t:setState(Constants.NetworkController.statesEntity.unstable)
    t.connectedObjs = {
        [1] = {}, --N
        [2] = {}, --E
        [3] = {}, --S
        [4] = {}, --W
    }
    t:collect()
    t.network.shouldRefresh = true
    UpdateSys.addEntity(t)
    return t
end

--Reconstructor
function NC:rebuild(object)
    if object == nil then return end
    local mt = {}
    mt.__index = NC
    setmetatable(object, mt)
    BaseNet:rebuild(object.network)
end

--Deconstructor
function NC:remove()
    if self.state ~= nil then self.state.destroy() end
    UpdateSys.remove(self)
end
--Is valid
function NC:valid()
    return self.thisEntity ~= nil and self.thisEntity.valid == true
end

function NC:setState(state)
    if self.state ~= nil then self.state.destroy() end
    self.state = self.thisEntity.surface.create_entity{name=state, position=self.thisEntity.position, force="neutral"}
    self.state.destructible = false
    self.state.operable = false
    self.state.minable = false
end

function NC:setActive(set)
    self.stable = set
    if set == true then
        self:setState(Constants.NetworkController.statesEntity.stable)
    elseif set == false then
        self:setState(Constants.NetworkController.statesEntity.unstable)
    end
end

function NC:update()
    self.lastUpdate = game.tick
    if valid(self) == false then
        self:remove()
        return
    end
    if self.thisEntity.to_be_deconstructed() == true then return end
    self:collect()
    if game.tick % self.updateTick == 0 or self.network.shouldRefresh == true or game.tick > self.lastUpdate then --Refreshes connections every 10 seconds
        self.network:doRefresh(self)
    end
    local powerDraw = self.network:getTotalObjects()
    --1.8MW buffer but 15KW energy at 900KMW- input
    --1.8MW buffer but 30KW energy at 1.8MW- input
    --1.8MW buffer but 1.8MW energy at 1.8MW+ input
    --Can check if energy*60 >= buffer then NC is stable
    --1 Joule converts to 60 Watts? How strange
    self.thisEntity.power_usage = powerDraw --Takes Joules as a param
    self.thisEntity.electric_buffer_size = math.max(powerDraw*300, 300) --Takes Joules as a param
    
    if self.thisEntity.energy >= powerDraw and self.thisEntity.energy ~= 0 then
        self:setActive(true)
    else
        self:setActive(false)
    end

    if not self.stable then return end

    if game.tick % Constants.Settings.RNS_CollectContents_Tick == 0 then self:collectContents() end
    if game.tick % Constants.Settings.RNS_Detector_Tick == 0 then self:updateDetectors() end

    if game.tick % Constants.Settings.RNS_ItemIO_Tick == 0 then self:updateItemIO() end --Base is every 4 ticks to match yellow belt speed at 15/s
    --local tickItemBeltIO = game.tick % (120/Constants.Settings.RNS_BaseItemIO_TickSpeed) --speed based on 1 side of a belt
    --if tickItemBeltIO >= 0.0 and tickItemBeltIO < 1.0 then self:updateItemIO(true) end

    if game.tick % Constants.Settings.RNS_FluidIO_Tick == 0 then self:updateFluidIO() end --Base is every 5 ticks to match offshore pump speed at 1200/s

    if game.tick % Constants.Settings.RNS_WirelessTransmitter_Tick == 0 then self:find_players_with_wirelessTransmitter() end --Updates every 30 ticks
end

function NC:updateDetectors()
    for _, detector in pairs(BaseNet.getOperableObjects(self.network.DetectorTable)[1]) do
        if detector.thisEntity ~= nil and detector.thisEntity.valid == true and detector.thisEntity.to_be_deconstructed() == false then
            detector:update_signal()
        end
    end
end

function NC:collectContents()
    self.network.Contents = {
        item = {},
        fluid = {}
    }
    local itemDrives = BaseNet.getOperableObjects(self.network.ItemDriveTable)
    local fluidDrives = BaseNet.getOperableObjects(self.network.FluidDriveTable)
    local externalInvs = BaseNet.filter_by_mode("output", BaseNet.filter_by_type("item", BaseNet.getOperableObjects(self.network.ExternalIOTable)))
    local externalTanks = BaseNet.filter_by_mode("output", BaseNet.filter_by_type("fluid", BaseNet.getOperableObjects(self.network.ExternalIOTable)))

    for i = 1, Constants.Settings.RNS_Max_Priority*2+1 do
        local priorityItems = itemDrives[i]
        local priorityFluids = fluidDrives[i]
        local priorityInvs = externalInvs[i]
        local priorityTanks = externalTanks[i]

        if Util.getTableLength(priorityItems) > 0 then
            for _, drive in pairs(priorityItems) do
                for name, content in pairs(drive.storageArray.item_list) do
                    self.network.Contents.item[name] = (self.network.Contents.item[name] or 0) + content.count
                end
                for name, count in pairs(drive.storageArray.inventory.get_contents()) do
                    self.network.Contents.item[name] = (self.network.Contents.item[name] or 0) + count
                end
            end
        end
        if Util.getTableLength(priorityFluids) > 0 then
            for _, drive in pairs(priorityFluids) do
                for name, content in pairs(drive.fluidArray) do
                    self.network.Contents.fluid[name] = (self.network.Contents.fluid[name] or 0) + content.amount
                end
            end
        end
        if Util.getTableLength(priorityInvs) > 0 then
            for _, eInv in pairs(priorityInvs) do
                if string.match(eInv.io, "output") == nil then goto next end
                if eInv.focusedEntity.thisEntity ~= nil and eInv.focusedEntity.thisEntity.valid == true and eInv.focusedEntity.thisEntity.to_be_deconstructed() == false and eInv.focusedEntity.inventory.values ~= nil then
                    local index = 0
                    repeat
                        local ii = Util.next(eInv.focusedEntity.inventory)
                        local inv = eInv.focusedEntity.thisEntity.get_inventory(ii.slot)
                        if inv ~= nil and IIO.check_operable_mode(ii.io, "output") then
                            for name, count in pairs(inv.get_contents()) do
                                self.network.Contents.item[name] = (self.network.Contents.item[name] or 0) + count
                            end
                        end
                        index = index + 1
                    until index == Util.getTableLength(eInv.focusedEntity.inventory.values)
                end
                ::next::
            end
        end
        if Util.getTableLength(priorityTanks) > 0 then
            for _, eTank in pairs(priorityTanks) do
                local fluid_box = eTank.focusedEntity.fluid_box
                if string.match(fluid_box.flow, "output") == nil then goto next end
                if eTank.focusedEntity.thisEntity ~= nil and eTank.focusedEntity.thisEntity.valid == true and eTank.focusedEntity.thisEntity.to_be_deconstructed() == false and eTank.focusedEntity.fluid_box.index ~= nil then
                    local tank = eTank.focusedEntity.thisEntity.fluidbox[fluid_box.index]
                    if tank == nil then goto next end
                    self.network.Contents.fluid[tank.name] = (self.network.Contents.fluid[tank.name] or 0) + tank.amount
                end
                ::next::
            end
        end
    end
end

function NC:find_players_with_wirelessTransmitter()
    local processed_players = {}
    for _, transmitter in pairs(BaseNet.getOperableObjects(self.network.WirelessTransmitterTable)[1]) do
        --For Players
        local characters = self.thisEntity.surface.find_entities_filtered{
            type = "character",
            area = {
                {transmitter.thisEntity.position.x-0.5-Constants.Settings.RNS_Default_WirelessGrid_Distance, transmitter.thisEntity.position.y-0.5-Constants.Settings.RNS_Default_WirelessGrid_Distance}, --top left
                {transmitter.thisEntity.position.x+0.5+Constants.Settings.RNS_Default_WirelessGrid_Distance, transmitter.thisEntity.position.y+0.5+Constants.Settings.RNS_Default_WirelessGrid_Distance} --bottom right
            }
        }
        for _, character in pairs(characters) do
            if character.player ~= nil and self.network.PlayerPorts[character.player.name] ~= nil then
                local RNSPlayer = getRNSPlayer(character.player.index)
                if RNSPlayer ~= nil and RNSPlayer.thisEntity ~= nil and RNSPlayer.thisEntity.valid == true and processed_players[character.player.index] == nil then
                    RNSPlayer:process_logistic_slots(self.network)
                    processed_players[character.player.index] = RNSPlayer
                end
            end
        end
    end

end

function NC:find_wirelessgrid_with_wirelessTransmitter(id)
    for _, transmitter in pairs(BaseNet.getOperableObjects(self.network.WirelessTransmitterTable)[1]) do
        --For Portable Wireless Grids
        local interfaces = self.thisEntity.surface.find_entities_filtered{
                name = Constants.WirelessGrid.name,
                area = {
                    {transmitter.thisEntity.position.x-0.5-Constants.Settings.RNS_Default_WirelessGrid_Distance, transmitter.thisEntity.position.y-0.5-Constants.Settings.RNS_Default_WirelessGrid_Distance}, --top left
                    {transmitter.thisEntity.position.x+0.5+Constants.Settings.RNS_Default_WirelessGrid_Distance, transmitter.thisEntity.position.y+0.5+Constants.Settings.RNS_Default_WirelessGrid_Distance} --bottom right
                }
            }
        for _, interface in pairs(interfaces) do
            if interface.unit_number == id then
                local inter = global.entityTable[interface.unit_number]
                if inter ~= nil and inter.thisEntity ~= nil and inter.thisEntity.valid == true then
                    if inter.network_controller_position.x ~= nil and inter.network_controller_position.y ~= nil and inter.network_controller_surface ~= nil then
                        if inter.network_controller_surface == self.thisEntity.surface.index and Util.positions_match(inter.network_controller_position, self.thisEntity.position) == true then
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

function NC:updateItemIO()
    local import = {}
    local export = {}
    for p, priority in pairs(BaseNet.getOperableObjects(self.network.ItemIOTable)) do
        import[p] = {}
        export[p] = {}
        for _, item in pairs(priority) do
            if item.io == "input" then table.insert(import[p], item) end
            if item.io == "output" then
                if settings.global[Constants.Settings.RNS_RoundRobin].value then
                    table.insert(export[p], item.processed == false and 1 or (Util.getTableLength(export[p])+1), item)
                else
                    table.insert(export[p], item)
                end
            end
        end
    end
    for _, priority in pairs(import) do
        for _, item in pairs(priority) do
            item:IO()
        end
    end
    for _, priority in pairs(export) do
        for _, item in pairs(priority) do
            item:IO()
        end
    end
end

function NC:updateFluidIO()
    local import = {}
    local export = {}
    for p, priority in pairs(BaseNet.getOperableObjects(self.network.FluidIOTable)) do
        import[p] = {}
        export[p] = {}
        for _, fluid in pairs(priority) do
            if fluid.io == "input" then table.insert(import[p], fluid) end
            if fluid.io == "output" then
                if settings.global[Constants.Settings.RNS_RoundRobin].value then
                    table.insert(export[p], fluid.processed == false and 1 or (Util.getTableLength(export[p])+1), fluid)
                else
                    table.insert(export[p], fluid)
                end
            end
        end
    end
    for _, priority in pairs(import) do
        for _, fluid in pairs(priority) do
            fluid:IO()
        end
    end
    for _, priority in pairs(export) do
        for _, fluid in pairs(priority) do
            fluid:IO()
        end
    end
end

function NC:resetCollection()
    self.connectedObjs = {
        [1] = {}, --N
        [2] = {}, --E
        [3] = {}, --S
        [4] = {}, --W
    }
end

function NC:getCheckArea()
    local x = self.thisEntity.position.x
    local y = self.thisEntity.position.y
    return {
        [1] = {direction = 1, startP = {x-1.5, y-2.5}, endP = {x+1.5, y-1.5}}, --North
        [2] = {direction = 2, startP = {x+1.5, y-1.5}, endP = {x+2.5, y+1.5}}, --East
        [4] = {direction = 4, startP = {x-1.5, y+1.5}, endP = {x+1.5, y+2.5}}, --South
        [3] = {direction = 3, startP = {x-2.5, y-1.5}, endP = {x-1.5, y+1.5}}, --West
    }
end

function NC:collect()
    local areas = self:getCheckArea()
    self:resetCollection()
    for _, area in pairs(areas) do
        local ents = self.thisEntity.surface.find_entities_filtered{area={area.startP, area.endP}}
        for _, ent in pairs(ents) do
            if ent ~= nil and ent.valid == true and string.match(ent.name, "RNS_") ~= nil and ent.operable then
                if global.entityTable[ent.unit_number] ~= nil then
                    local obj = global.entityTable[ent.unit_number]
                    if (string.match(obj.thisEntity.name, "RNS_NetworkCableIO") ~= nil and obj:getConnectionDirection() == area.direction) or obj.thisEntity.name == Constants.WirelessGrid.name then
                        --Do nothing
                    else
                        table.insert(self.connectedObjs[area.direction], obj)
                    end
                end
            end
        end
    end
end

--Tooltips
function NC:getTooltips(guiTable, mainFrame, justCreated)
    if justCreated == true then
        guiTable.vars.Gui_Title.caption = {"gui-description.RNS_NetworkController_Title"}
        mainFrame.style.height = 450

        local infoFrame = GuiApi.add_frame(guiTable, "InformationFrame", mainFrame, "vertical", true)
		infoFrame.style = Constants.Settings.RNS_Gui.frame_1
		infoFrame.style.vertically_stretchable = true
		infoFrame.style.minimal_width = 200
		infoFrame.style.left_margin = 3
		infoFrame.style.left_padding = 3
		infoFrame.style.right_padding = 3

        GuiApi.add_subtitle(guiTable, "", infoFrame, {"gui-description.RNS_Information"})

        GuiApi.add_label(guiTable, "EnergyUsage", infoFrame, {"gui-description.RNS_NetworkController_EnergyUsage", self.thisEntity.power_usage}, Constants.Settings.RNS_Gui.orange, nil, true)
        GuiApi.add_label(guiTable, "EnergyBuffer", infoFrame, {"gui-description.RNS_NetworkController_EnergyBuffer", self.thisEntity.electric_buffer_size}, Constants.Settings.RNS_Gui.orange, nil, true)
        GuiApi.add_progress_bar(guiTable, "EnergyBar", infoFrame, "", self.thisEntity.energy .. "/" .. self.thisEntity.electric_buffer_size, true, nil, self.thisEntity.energy/self.thisEntity.electric_buffer_size, 200, 25)
        
        GuiApi.add_label(guiTable, "", infoFrame, {"gui-description.RNS_Position", self.thisEntity.position.x, self.thisEntity.position.y}, Constants.Settings.RNS_Gui.white, "", false)
        GuiApi.add_label(guiTable, "", infoFrame, {"gui-description.RNS_Surface", self.thisEntity.surface.index}, Constants.Settings.RNS_Gui.white, "", false)

        local connectedStructuresFrame = GuiApi.add_frame(guiTable, "", mainFrame, "vertical")
		connectedStructuresFrame.style = Constants.Settings.RNS_Gui.frame_1
		connectedStructuresFrame.style.vertically_stretchable = true
		connectedStructuresFrame.style.minimal_width = 350
		connectedStructuresFrame.style.left_margin = 3
		connectedStructuresFrame.style.left_padding = 3
		connectedStructuresFrame.style.right_padding = 3

        GuiApi.add_subtitle(guiTable, "", connectedStructuresFrame, {"gui-description.RNS_NetworkController_Connections"})

        local connectedStructuresSP = GuiApi.add_scroll_pane(guiTable, "", connectedStructuresFrame, nil, false)
		connectedStructuresSP.style.vertically_stretchable = true
		connectedStructuresSP.style.bottom_margin = 3

        GuiApi.add_table(guiTable, "ConnectedStructuresTable", connectedStructuresSP, 2, true)
    end

    local energyUsage = guiTable.vars.EnergyUsage
    local energyBuffer = guiTable.vars.EnergyBuffer
    local energyBar = guiTable.vars.EnergyBar

    energyUsage.caption = {"gui-description.RNS_NetworkController_EnergyUsage", self.thisEntity.power_usage}
    energyBuffer.caption = {"gui-description.RNS_NetworkController_EnergyBuffer", self.thisEntity.electric_buffer_size}
    energyBar.tooltip = self.thisEntity.energy .. "/" .. self.thisEntity.electric_buffer_size
    energyBar.value = self.thisEntity.energy/self.thisEntity.electric_buffer_size

    local ConnectedStructuresTable = guiTable.vars.ConnectedStructuresTable
    ConnectedStructuresTable.clear()

    for _, t in pairs(Constants.Drives.ItemDrive) do
        local name = t.name
        local count = BaseNet.get_table_length_in_priority(self.network.getOperableObjects(self.network.filter_by_name(name, self.network.ItemDriveTable)))
        if count > 0 then
            GuiApi.add_item_frame(guiTable, "", ConnectedStructuresTable, name, count, 64, Constants.Settings.RNS_Gui.label_font_2)
        end
    end

    for _, t in pairs(Constants.Drives.FluidDrive) do
        local name = t.name
        local count = BaseNet.get_table_length_in_priority(self.network.getOperableObjects(self.network.filter_by_name(name, self.network.FluidDriveTable)))
        if count > 0 then
            GuiApi.add_item_frame(guiTable, "", ConnectedStructuresTable, name, count, 64, Constants.Settings.RNS_Gui.label_font_2)
        end
    end

    local itemIOcount = BaseNet.get_table_length_in_priority(self.network.getOperableObjects(self.network.ItemIOTable))
    if itemIOcount > 0 then
        GuiApi.add_item_frame(guiTable, "", ConnectedStructuresTable, Constants.NetworkCables.itemIO.slateEntity.name, itemIOcount, 64, Constants.Settings.RNS_Gui.label_font_2)
    end

    local fluidIOcount = BaseNet.get_table_length_in_priority(self.network.getOperableObjects(self.network.FluidIOTable))
    if fluidIOcount > 0 then
        GuiApi.add_item_frame(guiTable, "", ConnectedStructuresTable, Constants.NetworkCables.fluidIO.slateEntity.name, fluidIOcount, 64, Constants.Settings.RNS_Gui.label_font_2)
    end

    local externalIOcount = BaseNet.get_table_length_in_priority(self.network.getOperableObjects(self.network.ExternalIOTable))
    if externalIOcount > 0 then
        GuiApi.add_item_frame(guiTable, "", ConnectedStructuresTable, Constants.NetworkCables.externalIO.slateEntity.name, externalIOcount, 64, Constants.Settings.RNS_Gui.label_font_2)
    end

    local interfacecount = BaseNet.get_table_length_in_priority(self.network.getOperableObjects(self.network.NetworkInventoryInterfaceTable))
    if interfacecount > 0 then
        GuiApi.add_item_frame(guiTable, "", ConnectedStructuresTable, Constants.NetworkInventoryInterface.name, interfacecount, 64, Constants.Settings.RNS_Gui.label_font_2)
    end

    local wirelessTransmittercount = BaseNet.get_table_length_in_priority(self.network.getOperableObjects(self.network.WirelessTransmitterTable))
    if wirelessTransmittercount > 0 then
        GuiApi.add_item_frame(guiTable, "", ConnectedStructuresTable, Constants.NetworkCables.wirelessTransmitter.slateEntity.name, wirelessTransmittercount, 64, Constants.Settings.RNS_Gui.label_font_2)
    end

    local detectorcount = BaseNet.get_table_length_in_priority(self.network.getOperableObjects(self.network.DetectorTable))
    if detectorcount > 0 then
        GuiApi.add_item_frame(guiTable, "", ConnectedStructuresTable, Constants.Detector.name, detectorcount, 64, Constants.Settings.RNS_Gui.label_font_2)
    end

end