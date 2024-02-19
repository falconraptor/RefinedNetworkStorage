NII = {
    thisEntity = nil,
    entID = nil,
    networkController = nil,
    connectedObjs = nil,
    cardinals = nil,
    powerUsage = 20
}

function NII:new(object)
    if object == nil then return end
    local t = {}
    local mt = {}
    setmetatable(t, mt)
    mt.__index = NII
    t.thisEntity = object
    t.entID = object.unit_number
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
    UpdateSys.add_to_entity_table(t)
    t:createArms()
    BaseNet.postArms(t)
    BaseNet.update_network_controller(t.networkController)
    --UpdateSys.addEntity(t)
    return t
end

function NII:rebuild(object)
    if object == nil then return end
    local mt = {}
    mt.__index = NII
    setmetatable(object, mt)
end

function NII:remove()
    UpdateSys.remove_from_entity_table(self)
    BaseNet.postArms(self)
    --[[if self.networkController ~= nil then
        self.networkController.network.NetworkInventoryInterfaceTable[1][self.entID] = nil
        self.networkController.network.shouldRefresh = true
    end]]
    BaseNet.update_network_controller(self.networkController, self.entID)
end

function NII:valid()
    return self.thisEntity ~= nil and self.thisEntity.valid == true
end

--[[function NII:update()
    if valid(self) == false then
        self:remove()
        return
    end
    if valid(self.networkController) == false then
        self.networkController = nil
    end
    if self.thisEntity.to_be_deconstructed() == true then return end
	--if game.tick % 25 then self:createArms() end
end]]

function NII:resetCollection()
    self.connectedObjs = {
        [1] = {}, --N
        [2] = {}, --E
        [3] = {}, --S
        [4] = {}, --W
    }
end

function NII:getCheckArea()
    local x = self.thisEntity.position.x
    local y = self.thisEntity.position.y
    return {
        [1] = {direction = 1, startP = {x-0.5, y-1.5}, endP = {x+0.5, y-0.5}}, --North
        [2] = {direction = 2, startP = {x+0.5, y-0.5}, endP = {x+1.5, y+0.5}}, --East
        [4] = {direction = 4, startP = {x-0.5, y+0.5}, endP = {x+0.5, y+1.5}}, --South
        [3] = {direction = 3, startP = {x-1.5, y-0.5}, endP = {x-0.5, y+0.5}}, --West
    }
end

function NII:createArms()
    local areas = self:getCheckArea()
    self:resetCollection()
    for _, area in pairs(areas) do
        local ents = self.thisEntity.surface.find_entities_filtered{area={area.startP, area.endP}}
        for _, ent in pairs(ents) do
            if ent ~= nil and ent.valid == true and ent.to_be_deconstructed() == false and string.match(ent.name, "RNS_") ~= nil and global.entityTable[ent.unit_number] ~= nil then
                local obj = global.entityTable[ent.unit_number]
                if (string.match(obj.thisEntity.name, "RNS_NetworkCableIO") ~= nil and obj:getConnectionDirection() == area.direction) or (string.match(obj.thisEntity.name, "RNS_NetworkCableRamp") ~= nil and obj:getConnectionDirection() == area.direction) or obj.thisEntity.name == Constants.WirelessGrid.name then
                    --Do nothing
                else
                    table.insert(self.connectedObjs[area.direction], obj)
                    BaseNet.join_network(self, obj)
                end
            end
        end
    end
end

function NII:getTooltips(guiTable, mainFrame, justCreated)
    local RNSPlayer = guiTable.RNSPlayer

    if justCreated == true then
        -- Set the GUI Title --
		guiTable.vars.Gui_Title.caption = {"gui-description.RNS_NetworkInventoryInterface_Title"}

		-- Set the Main Frame Height --
		mainFrame.style.height = 450

		-- Create the Network Inventory Frame --
		local inventoryFrame = GuiApi.add_frame(guiTable, "InventoryFrame", mainFrame, "vertical", true)
		inventoryFrame.style = Constants.Settings.RNS_Gui.frame_1
		inventoryFrame.style.vertically_stretchable = true
		inventoryFrame.style.left_padding = 3
		inventoryFrame.style.right_padding = 3
		inventoryFrame.style.left_margin = 3
		inventoryFrame.style.right_margin = 3

		-- Add the Title --
		GuiApi.add_subtitle(guiTable, "", inventoryFrame, {"gui-description.RNS_NetworkInventory"})

		-- Create the Network Inventory Scroll Pane --
		local inventoryScrollPane = GuiApi.add_scroll_pane(guiTable, "InventoryScrollPane", inventoryFrame, 500, true)
		inventoryScrollPane.style = Constants.Settings.RNS_Gui.scroll_pane
		inventoryScrollPane.style.minimal_width = 308
		inventoryScrollPane.style.vertically_stretchable = true
		inventoryScrollPane.style.bottom_margin = 3

		-- Create the Player Inventory Frame --
		local playerInventoryFrame = GuiApi.add_frame(guiTable, "PlayerInventoryFrame", mainFrame, "vertical", true)
		playerInventoryFrame.style = Constants.Settings.RNS_Gui.frame_1
		playerInventoryFrame.style.vertically_stretchable = true
		playerInventoryFrame.style.left_padding = 3
		playerInventoryFrame.style.left_margin = 3
		playerInventoryFrame.style.right_padding = 3
		playerInventoryFrame.style.right_margin = 3
		
		-- Add the Title --
		GuiApi.add_subtitle(guiTable, "", playerInventoryFrame, {"gui-description.RNS_PlayerInventory"})

		-- Create the Player Inventory Scroll Pane --
		local playerInventoryScrollPane = GuiApi.add_scroll_pane(guiTable, "PlayerInventoryScrollPane", playerInventoryFrame, 500,true)
		playerInventoryScrollPane.style = Constants.Settings.RNS_Gui.scroll_pane
		playerInventoryScrollPane.style.minimal_width = 308
		playerInventoryScrollPane.style.vertically_stretchable = true
		playerInventoryScrollPane.style.bottom_margin = 3

		-- Create the Information Frame --
		local informationFrame = GuiApi.add_frame(guiTable, "InformationFrame", mainFrame, "vertical", true)
		informationFrame.style = Constants.Settings.RNS_Gui.frame_1
		informationFrame.style.vertically_stretchable = true
		informationFrame.style.left_padding = 3
		informationFrame.style.right_padding = 3
		informationFrame.style.right_margin = 3
		informationFrame.style.minimal_width = 200

		-- Add the Title --
		GuiApi.add_subtitle(guiTable, "", informationFrame, {"gui-description.RNS_Information"})

		--GuiApi.add_label(guiTable, "InventorySize", informationFrame, {"gui-description.RNS_Inventory_Size", 0, 0}, Constants.Settings.RNS_Gui.white, "", true, Constants.Settings.RNS_Gui.label_font)
--
		--GuiApi.add_line(guiTable, "", informationFrame, "horizontal")

		-- Create the Search Flow --
		local searchFlow = GuiApi.add_flow(guiTable, "", informationFrame, "horizontal")
		searchFlow.style.vertical_align = "center"
		
		-- Create the Search Label --
		GuiApi.add_label(guiTable, "Label", searchFlow, {"", {"gui-description.RNS_SearchText"}, ": "}, nil, {"gui-description.RNS_SearchText"}, false)
		
		-- Create the Search TextField
		local textField = GuiApi.add_text_field(guiTable, "RNS_SearchTextField", searchFlow, "", "", true, false, false, false, false)
		textField.style.maximal_width = 130

		-- Add the Line --
		GuiApi.add_line(guiTable, "", informationFrame, "horizontal")

		-- Create the Help Table --
		local helpTable = GuiApi.add_table(guiTable, "", informationFrame, 1)

		-- Create the Information Labels --
		GuiApi.add_label(guiTable, "", helpTable, {"gui-description.RNS_HelpText1"}, Constants.Settings.RNS_Gui.white)
		GuiApi.add_label(guiTable, "", helpTable, {"gui-description.RNS_HelpText2"}, Constants.Settings.RNS_Gui.white)
		GuiApi.add_label(guiTable, "", helpTable, {"gui-description.RNS_HelpText3"}, Constants.Settings.RNS_Gui.white)
		GuiApi.add_label(guiTable, "", helpTable, {"gui-description.RNS_HelpText4"}, Constants.Settings.RNS_Gui.white)
		GuiApi.add_label(guiTable, "", helpTable, {"gui-description.RNS_HelpText5"}, Constants.Settings.RNS_Gui.white)
		--GuiApi.add_label(guiTable, "", helpTable, {"gui-description.RNS_HelpText6"}, Constants.Settings.RNS_Gui.white)

		--GuiApi.add_line(guiTable, "", informationFrame, "horizontal")

		--GuiApi.add_label(guiTable, "", informationFrame, {"gui-description.RNS_Position", self.thisEntity.position.x, self.thisEntity.position.y}, Constants.Settings.RNS_Gui.white, "", false)

    end

	local inventoryScrollPane = guiTable.vars.InventoryScrollPane
	local playerInventoryScrollPane = guiTable.vars.PlayerInventoryScrollPane
	--local inventorySize = guiTable.vars.InventorySize
	local textField = guiTable.vars.RNS_SearchTextField

	inventoryScrollPane.clear()
	playerInventoryScrollPane.clear()

    if self.networkController == nil or not self.networkController.stable or (self.networkController.thisEntity ~= nil and self.networkController.thisEntity.valid == false) then return end
	
	--local t, m = self.networkController.network:get_item_storage_size()
	--inventorySize.caption = {"gui-description.RNS_Inventory_Size", t, m}


	self:createNetworkInventory(guiTable, RNSPlayer, inventoryScrollPane, textField.text)

	self:createPlayerInventory(guiTable, RNSPlayer, playerInventoryScrollPane, textField.text)

end

function NII:createPlayerInventory(guiTable, RNSPlayer, scrollPane, text)
	local tableList = GuiApi.add_table(guiTable, "", scrollPane, 8)
	
	local inv = RNSPlayer:get_inventory()
	if Util.getTableLength(inv) == 0 then return end

	for i = 1, Util.getTableLength(inv) do
		local item = inv[i]
		RNSPlayer.thisEntity.request_translation(Util.get_item_name(item.cont.name))
		if Util.get_item_name(item.cont.name)[1] ~= nil then
			local locName = Util.get_item_name(item.cont.name)[1]
			if text ~= nil and text ~= "" and locName ~= nil and string.match(string.lower(locName), string.lower(text)) == nil then goto continue end
		end

		local buttonText = {"", "[color=blue]", item.label or Util.get_item_name(item.cont.name), "[/color]\n", {"gui-description.RNS_count"}, Util.toRNumber(item.cont.count)}
		if item.cont.health < 1 then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_health"})
			table.insert(buttonText, math.floor(item.cont.health*100) .. "%")
		end
		
		if item.cont.tags ~= nil and Util.getTableLength(item.cont.tags) ~= 0 and item.description ~= "" then
			table.insert(buttonText, "\n")
			table.insert(buttonText, item.description)
		elseif item.modified ~= nil and item.modified == true then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_item_modified"})
		end
		
		if item.cont.ammo ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_ammo"})
			table.insert(buttonText, item.cont.ammo .. "/" .. game.item_prototypes[item.cont.name].magazine_size)
		end
		if item.cont.durability ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_durability"})
			table.insert(buttonText, item.cont.durability .. "/" .. game.item_prototypes[item.cont.name].durability)
		end
		if item.linked ~= nil and item.linked ~= "" then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_linked"})
			table.insert(buttonText, item.linked.entity_label or Util.get_item_name(item.linked.name))
		end
		GuiApi.add_button(guiTable, "RNS_NII_PInv_" .. i, tableList, "item/" .. (item.cont.name), "item/" .. (item.cont.name), "item/" .. (item.cont.name), buttonText, 37, false, true, item.cont.count, ((item.modified or (item.cont.ammo and item.cont.ammo < game.item_prototypes[item.cont.name].magazine_size) or (item.cont.durability and item.cont.durability < game.item_prototypes[item.cont.name].durability)) and {Constants.Settings.RNS_Gui.button_2} or {Constants.Settings.RNS_Gui.button_1})[1], {ID=self.thisEntity.unit_number, name=(item.cont.name), stack=item})
		
		::continue::
	end
end

function NII:createNetworkInventory(guiTable, RNSPlayer, inventoryScrollPane, text)
	local tableList = GuiApi.add_table(guiTable, "", inventoryScrollPane, 8)
	local inv = {}
	local fluid = {}
	for _, priority in pairs(BaseNet.getOperableObjects(self.networkController.network.ItemDriveTable)) do
		for _, drive in pairs(priority) do
			for _, v in pairs(drive.storageArray) do
				local c = Util.itemstack_template(v.name)
				c.cont.count = v.count
				if c.cont.ammo then c.cont.ammo = v.ammo end
				if c.cont.durability then c.cont.durability = v.durability end
				Util.add_or_merge(c, inv, true)
			end
		end
	end
	for _, priority in pairs(BaseNet.getOperableObjects(self.networkController.network.FluidDriveTable)) do
		for _, drive in pairs(priority) do
			for k, c in pairs(drive.fluidArray) do
				if c == nil then goto continue end
				if fluid[k] ~= nil then
					fluid[k].amount = fluid[k].amount + c.amount
					fluid[k].temperature = (fluid[k].temperature * fluid[k].amount + c.amount * (c.temperature or game.fluid_prototypes[c.name].default_temperature)) / (fluid[k].amount + c.amount)
				else
					fluid[k] = {
						name = c.name,
						amount = c.amount,
						temperature = c.temperature
					}
				end
				::continue::
			end
		end
	end
	for _, priority in pairs(BaseNet.filter_by_mode("output", BaseNet.getOperableObjects(self.networkController.network:filter_externalIO_by_valid_signal(), "eo"))) do
		for _, external in pairs(priority) do
			if external.focusedEntity.thisEntity ~= nil and external.focusedEntity.thisEntity.valid and external.focusedEntity.thisEntity.to_be_deconstructed() == false then
				if external.type == "item" and external.focusedEntity.inventory.values ~= nil then
					local index = 0
					repeat
						local ii = Util.next(external.focusedEntity.inventory)
						local inv1 = external.focusedEntity.thisEntity.get_inventory(ii.slot)
						if inv1 ~= nil and IIO.check_operable_mode(ii.io, "output") then
							inv1.sort_and_merge()
							for i = 1, #inv1 do
								local itemstack = inv1[i]
								if itemstack.count <= 0 then goto continue end
								Util.add_or_merge(itemstack, inv)
								::continue::
							end
						end
						index = index + 1
					until index == Util.getTableLength(external.focusedEntity.inventory.values)
				elseif external.type == "fluid" and external.focusedEntity.fluid_box.index ~= nil then
					if string.match(external.focusedEntity.fluid_box.flow, "output") ~= nil then
						if external.focusedEntity.thisEntity.fluidbox[external.focusedEntity.fluid_box.index] ~= nil then
							local fluidbox = external.focusedEntity.thisEntity.fluidbox[external.focusedEntity.fluid_box.index]
							if fluid[fluidbox.name] ~= nil then
								fluid[fluidbox.name].amount = fluid[fluidbox.name].amount + fluidbox.amount
								fluid[fluidbox.name].temperature = (fluid[fluidbox.name].temperature * fluid[fluidbox.name].amount + fluidbox.amount * (fluidbox.temperature or game.fluid_prototypes[c.name].default_temperature)) / (fluid[fluidbox.name].amount + fluidbox.amount)
							else
								fluid[fluidbox.name] = {
									name = fluidbox.name,
									amount = fluidbox.amount,
									temperature = fluidbox.temperature
								}
							end
						end
					end
				end
			end
		end
	end
	-----------------------------------------------------------------------------------Fluids----------------------------------------------------------------------------------------
	if Util.getTableLength(fluid) > 0 then
		for k, c in pairs(fluid) do
			RNSPlayer.thisEntity.request_translation(Util.get_fluid_name(c.name))
			if Util.get_fluid_name(c.name)[1] ~= nil then
				local locName = Util.get_fluid_name(c.name)[1]
				if text ~= nil and text ~= "" and locName ~= nil and string.match(string.lower(locName), string.lower(text)) == nil then goto continue end
			end
			local buttonText = {"", "[color=blue]", Util.get_fluid_name(c.name), "[/color]\n", {"gui-description.RNS_count"}, Util.toRNumber(c.amount), "\n", {"gui-description.RNS_Temperature"}, c.temperature or game.fluid_prototypes[c.name].default_temperature}
			GuiApi.add_button(guiTable, "RNS_NII_FDInv_".. k, tableList, "fluid/" .. (c.name), "fluid/" .. (c.name), "fluid/" .. (c.name), buttonText, 37, false, true, c.amount, Constants.Settings.RNS_Gui.button_1, {ID=self.entID, name=c.name})
			::continue::
		end
	end
	-----------------------------------------------------------------------------------Items----------------------------------------------------------------------------------------
	if Util.getTableLength(inv) > 0 then
		for i = 1, Util.getTableLength(inv) do
			local item = inv[i]
			RNSPlayer.thisEntity.request_translation(Util.get_item_name(item.cont.name))
			if Util.get_item_name(item.cont.name)[1] ~= nil then
				local locName = Util.get_item_name(item.cont.name)[1]
				if text ~= nil and text ~= "" and locName ~= nil and string.match(string.lower(locName), string.lower(text)) == nil then goto continue end
			end

			local buttonText = {"", "[color=blue]", item.label or Util.get_item_name(item.cont.name), "[/color]\n", {"gui-description.RNS_count"}, Util.toRNumber(item.cont.count)}
			if item.cont.health < 1 then
				table.insert(buttonText, "\n")
				table.insert(buttonText, {"gui-description.RNS_health"})
				table.insert(buttonText, math.floor(item.cont.health*100) .. "%")
			end
			
			if item.cont.tags ~= nil and Util.getTableLength(item.cont.tags) ~= 0 and item.description ~= "" then
				table.insert(buttonText, "\n")
				table.insert(buttonText, item.description)
			elseif item.modified ~= nil and item.modified == true then
				table.insert(buttonText, "\n")
				table.insert(buttonText, {"gui-description.RNS_item_modified"})
			end
			
			if item.cont.ammo ~= nil then
				table.insert(buttonText, "\n")
				table.insert(buttonText, {"gui-description.RNS_ammo"})
				table.insert(buttonText, item.cont.ammo .. "/" .. game.item_prototypes[item.cont.name].magazine_size)
			end
			if item.cont.durability ~= nil then
				table.insert(buttonText, "\n")
				table.insert(buttonText, {"gui-description.RNS_durability"})
				table.insert(buttonText, item.cont.durability .. "/" .. game.item_prototypes[item.cont.name].durability)
			end
			if item.linked ~= nil and item.linked ~= "" then
				table.insert(buttonText, "\n")
				table.insert(buttonText, {"gui-description.RNS_linked"})
				table.insert(buttonText, item.linked.entity_label or Util.get_item_name(item.linked.name))
			end
			GuiApi.add_button(guiTable, "RNS_NII_IDInv_".. i, tableList, "item/" .. (item.cont.name), "item/" .. (item.cont.name), "item/" .. (item.cont.name), buttonText, 37, false, true, item.cont.count, ((item.modified or (item.cont.ammo and item.cont.ammo < game.item_prototypes[item.cont.name].magazine_size) or (item.cont.durability and item.cont.durability < game.item_prototypes[item.cont.name].durability)) and {Constants.Settings.RNS_Gui.button_2} or {Constants.Settings.RNS_Gui.button_1})[1], {ID=self.thisEntity.unit_number, name=(item.cont.name), stack=item})
			::continue::
		end
	end
end


function NII.transfer_from_pinv(RNSPlayer, NII, tags, count)
	if RNSPlayer.thisEntity == nil or NII == nil then return end
	local network = NII.networkController ~= nil and NII.networkController.network or nil
	if network == nil then return end
	if tags == nil then return end
	local itemstack = tags.stack
	--if itemstack.id ~= nil and global.itemTable[itemstack.id] ~= nil and global.itemTable[itemstack.id].is_active == true then return end

	if count == -1 then count = game.item_prototypes[itemstack.cont.name].stack_size end
	if count == -2 then count = math.max(1, game.item_prototypes[itemstack.cont.name].stack_size/2) end
	if count == -3 then count = game.item_prototypes[itemstack.cont.name].stack_size*10 end
	if count == -4 then count = (2^32)-1 end

	local inv = RNSPlayer.thisEntity.get_main_inventory()
	local amount = math.min(itemstack.cont.count, count)
	if amount <= 0 then return end

	local itemDrives = BaseNet.getOperableObjects(network.ItemDriveTable)
	local externalItems = network:filter_externalIO_by_valid_signal()
	for i = 1, Constants.Settings.RNS_Max_Priority*2 + 1 do
		local priorityD = itemDrives[i]
		local priorityE = externalItems[i].item
		for _, drive in pairs(priorityD) do
			if drive:has_room() then
				amount = amount - BaseNet.transfer_from_inv_to_drive(inv, drive, itemstack, nil, math.min(amount, drive:getRemainingStorageSize()), false, true)
				if amount <= 0 then return end
			end
		end
		for _, external in pairs(priorityE) do
			if external:target_interactable() and external:interactable() and string.match(external.io, "input") ~= nil and external.focusedEntity.inventory.item.input.max ~= 0 then
				local index = 0
				repeat
					Util.next_index(external.focusedEntity.inventory.item.input)
					local ii = external.focusedEntity.inventory.item.input.values[external.focusedEntity.inventory.item.input.index]
					local inv1 = external.focusedEntity.thisEntity.get_inventory(ii)
					if inv1 ~= nil then
						if BaseNet.inventory_is_sortable(inv1) then inv1.sort_and_merge() end
						if EIO.has_item_room(inv1) == true then
							--[[if external.metadataMode == false then
								if itemstack.modified == true then return end
								if itemstack.cont.ammo ~= game.item_prototypes[itemstack.cont.name].magazine_size then return end
								if itemstack.cont.durability ~= game.item_prototypes[itemstack.cont.name].durability then return end
							end]]
							amount = amount - BaseNet.transfer_from_inv_to_inv(inv, inv1, itemstack, external, amount, false, true)
							if amount <= 0 then return end
						end
					end
					index = index + 1
				until index == Util.getTableLength(external.focusedEntity.inventory.item.input.max)
			end
			::next::
		end
	end

	--[[
	for _, priority in pairs(network.getOperableObjects(network.ItemDriveTable)) do
		for _, drive in pairs(priority) do
			if drive:has_room() then
				amount = amount - BaseNet.transfer_from_inv_to_drive(inv, drive, itemstack, math.min(amount, drive:getRemainingStorageSize()), false, true)
				if amount <= 0 then return end
			end
		end
	end
	]]
end

function NII.transfer_from_idinv(RNSPlayer, NII, tags, count)
	if RNSPlayer.thisEntity == nil or NII == nil then return end
	local network = NII.networkController ~= nil and NII.networkController.network or nil
	if network == nil then return end
	if tags == nil then return end
	local itemstack = tags.stack

	if count == -1 then count = game.item_prototypes[itemstack.cont.name].stack_size end
	if count == -2 then count = math.max(1, game.item_prototypes[itemstack.cont.name].stack_size/2) end
	if count == -3 then count = game.item_prototypes[itemstack.cont.name].stack_size*10 end
	if count == -4 then count = (2^32)-1 end

	local inv = RNSPlayer.thisEntity.get_main_inventory()
	local amount = math.min(itemstack.cont.count, count)
	if amount <= 0 then return end

	local itemDrives = BaseNet.getOperableObjects(network.ItemDriveTable)
	local externalItems = network:filter_externalIO_by_valid_signal()
	for i = 1, Constants.Settings.RNS_Max_Priority*2 + 1 do
		local priorityD = itemDrives[i]
		local priorityE = externalItems[i].item
		for _, drive in pairs(priorityD) do
			local has = drive:has_item(itemstack, true)
			if has > 0 and RNSPlayer:has_room() == true then
				amount = amount - BaseNet.transfer_from_drive_to_inv(drive, inv, itemstack, math.min(amount, has), false)
				if amount <= 0 then return end
			end
		end
		for _, external in pairs(priorityE) do
			if external:target_interactable() and external:interactable() and string.match(external.io, "output") ~= nil and external.focusedEntity.inventory.item.output.max ~= 0 then
				local index = 0
				repeat
					Util.next_index(external.focusedEntity.inventory.item.output)
					local ii = external.focusedEntity.inventory.item.output.values[external.focusedEntity.inventory.item.output.index]
					local inv1 = external.focusedEntity.thisEntity.get_inventory(ii)
					if inv1 ~= nil then
						if BaseNet.inventory_is_sortable(inv1) then inv1.sort_and_merge() end
						local has = EIO.has_item(inv1, itemstack, true)
						if has > 0 and RNSPlayer:has_room() == true then
							--[[if external.metadataMode == false then
								if itemstack.modified == true then return end
								if itemstack.cont.ammo ~= game.item_prototypes[itemstack.cont.name].magazine_size then return end
								if itemstack.cont.durability ~= game.item_prototypes[itemstack.cont.name].durability then return end
							end]]
							amount = amount - BaseNet.transfer_from_inv_to_inv(inv1, inv, itemstack, nil, math.min(has, amount), false, true)
							if amount <= 0 then return end
						end
					end
					index = index + 1
				until index == Util.getTableLength(external.focusedEntity.inventory.item.output.max)
			end
			::next::
		end
	end

	--[[
	for _, priority in pairs(network.getOperableObjects(network.ItemDriveTable)) do
		for _, drive in pairs(priority) do
			if RNSPlayer:has_room() then
				amount = amount - BaseNet.transfer_from_drive_to_inv(drive, inv, itemstack, math.min(amount, drive:getRemainingStorageSize()), false)
				if amount <= 0 then return end
			else
				return
			end
		end
	end
	]]
end

function NII.transfer_from_fdinv(RNSPlayer, NII, tags, count)
	if RNSPlayer.thisEntity == nil or NII == nil then return end
	local network = NII.networkController ~= nil and NII.networkController.network or nil
	if network == nil then return end
	if tags == nil then return end
	local fluid = tags.name

	--if count == -1 then count = game.item_prototypes[itemstack.cont.name].stack_size end
	--if count == -2 then count = math.max(1, game.item_prototypes[itemstack.cont.name].stack_size/2) end
	--if count == -3 then count = game.item_prototypes[itemstack.cont.name].stack_size*10 end
	--if count == -4 then count = (2^32)-1 end
--
	--local inv = RNSPlayer.thisEntity.get_main_inventory()
	--local amount = math.min(itemstack.cont.count, count)
	--if amount <= 0 then return end
--
	--for _, drive in pairs(network.getOperableObjects(network.ItemDriveTable)) do
	--	if RNSPlayer:has_room() then
	--		--local transfered = BaseNet.transfer_item(drive:get_sorted_and_merged_inventory(), inv, itemstack, math.min(amount, drive:has_item(itemstack)), false, true, "array_to_inv")
	--		amount = amount - BaseNet.transfer_from_drive_to_inv(drive, inv, itemstack, math.min(amount, drive:getRemainingStorageSize()), false)
	--		if amount <= 0 then return end
	--	else
	--		return
	--	end
	--end
end

function NII.interaction(event, RNSPlayer)
	if string.match(event.element.name, "RNS_SearchTextField") then return end
	local count = 0
	if event.button == defines.mouse_button_type.left then count = 1 end --1 Item
	if event.button == defines.mouse_button_type.left and event.shift == true then count = -1 end --1 Stack
	if event.button == defines.mouse_button_type.right then count = -2 end --Half Stack
	if event.button == defines.mouse_button_type.right and event.shift == true then count = -3 end --10 Stacks
	if event.button == defines.mouse_button_type.left and event.control == true then count = -4 end --All Stacks

	if string.match(event.element.name, "RNS_NII_PInv") then
		local obj = global.entityTable[event.element.tags.ID]
		NII.transfer_from_pinv(RNSPlayer, obj, event.element.tags, count)
		return
	end

	if string.match(event.element.name, "RNS_NII_IDInv") then
		local obj = global.entityTable[event.element.tags.ID]
		NII.transfer_from_idinv(RNSPlayer, obj, event.element.tags, count)
		return
	end

	if string.match(event.element.name, "RNS_NII_FDInv") then
		local obj = global.entityTable[event.element.tags.ID]
		NII.transfer_from_fdinv(RNSPlayer, obj, event.element.tags, count)
		return
	end

end