WG = {
    thisEntity = nil,
    entID = nil,
	networkController = nil,
    network_controller_position = nil,
	network_controller_surface = nil
}

function WG:new(object)
    if object == nil then return end
    local t = {}
    local mt = {}
    setmetatable(t, mt)
    mt.__index = WG
    t.thisEntity = object
    t.entID = object.unit_number
    t.network_controller_position = {
        x = nil,
        y = nil
    }
    UpdateSys.add_to_entity_table(t)
    UpdateSys.addEntity(t)
    return t
end

function WG:rebuild(object)
    if object == nil then return end
    local mt = {}
    mt.__index = WG
    setmetatable(object, mt)
end

--Deconstructor
function WG:remove()
    UpdateSys.remove_from_entity_table(self)
    UpdateSys.remove(self)
end
--Is valid
function WG:valid()
    return self.thisEntity ~= nil and self.thisEntity.valid == true
end

function WG:update()
    if valid(self) == false then
        self:remove()
        return
    end
	if self.networkController ~= nil and self.networkController.thisEntity.valid == false then
		self.networkController = nil
	end
	if self.networkController == nil and self.network_controller_position.x ~= nil and self.network_controller_position.y ~= nil and self.network_controller_surface ~= nil then
		local controller = game.surfaces[self.network_controller_surface].find_entity(Constants.NetworkController.main.name, self.network_controller_position)
		if controller ~= nil and global.entityTable[controller.unit_number] ~= nil then
			self.networkController = global.entityTable[controller.unit_number]
		end
	end
end

function WG:copy_settings(obj)
	self.network_controller_position = obj.network_controller_position
	self.network_controller_surface = obj.network_controller_surface
end

function WG:serialize_settings()
    local tags = {}
    tags["surface"] = self.self.network_controller_surface
	tags["position"] = self.network_controller_position
    return tags
end

function WG:deserialize_settings(tags)
    self.network_controller_surface = tags["surface"]
	self.network_controller_position = tags["position"]
end

function WG:DataConvert_ItemToEntity(tag_contents)
    self.network_controller_surface = tag_contents.surfaceID
	self.network_controller_position = tag_contents.position
end

function WG:DataConvert_EntityToItem(item)
	local pos = "{" .. (self.network_controller_position.x or " ") .. "," .. (self.network_controller_position.y or " ") .. "}"
	local surf = self.network_controller_surface ~= nil and game.surfaces[self.network_controller_surface].name or "_"
	item.custom_description = {"", item.prototype.localised_description, {"item-description.RNS_WirelessGrid_Tag", pos, surf}}
    item.set_tag(Constants.Settings.RNS_Tag, {surfaceID=self.network_controller_surface, position=self.network_controller_position})
end

function WG:getTooltips(guiTable, mainFrame, justCreated)
    local RNSPlayer = guiTable.RNSPlayer

    if justCreated == true then
        -- Set the GUI Title --
		guiTable.vars.Gui_Title.caption = {"gui-description.RNS_WirelessGrid_Title"}

		-- Set the Main Frame Height --
		mainFrame.style.height = 450

		local infoFrame = GuiApi.add_frame(guiTable, "InformationFrame", mainFrame, "vertical", true)
		infoFrame.style = Constants.Settings.RNS_Gui.frame_1
		infoFrame.style.vertically_stretchable = true
		infoFrame.style.minimal_width = 200
		infoFrame.style.left_margin = 3
		infoFrame.style.left_padding = 3
		infoFrame.style.right_padding = 3
		GuiApi.add_subtitle(guiTable, "", infoFrame, {"gui-description.RNS_Information"})

        GuiApi.add_label(guiTable, "", infoFrame, {"gui-description.RNS_WirelessGrid_Target"}, Constants.Settings.RNS_Gui.white)

        local xflow = GuiApi.add_flow(guiTable, "", infoFrame, "horizontal")
        GuiApi.add_label(guiTable, "", xflow, {"gui-description.RNS_xPos"}, Constants.Settings.RNS_Gui.white)
        local xPos = GuiApi.add_text_field(guiTable, "RNS_WirelessGrid_xPos", xflow, self.network_controller_position.x == nil and "" or tostring(self.network_controller_position.x), {"gui-description.RNS_xPos_tooltip"}, true, true, true, true, false, {ID=self.entID})
        xPos.style.maximal_width = 50

        local yflow = GuiApi.add_flow(guiTable, "", infoFrame, "horizontal")
        GuiApi.add_label(guiTable, "", yflow, {"gui-description.RNS_yPos"}, Constants.Settings.RNS_Gui.white)
        local yPos = GuiApi.add_text_field(guiTable, "RNS_WirelessGrid_yPos", yflow, self.network_controller_position.y == nil and "" or tostring(self.network_controller_position.y), {"gui-description.RNS_yPos_tooltip"}, true, true, true, true, false, {ID=self.entID})
        yPos.style.maximal_width = 50

        local surfIDflow = GuiApi.add_flow(guiTable, "", infoFrame, "horizontal")
        GuiApi.add_label(guiTable, "", surfIDflow, {"gui-description.RNS_SurfaceID"}, Constants.Settings.RNS_Gui.white)
        local surfID = GuiApi.add_text_field(guiTable, "RNS_WirelessGrid_SurfaceID", surfIDflow, self.network_controller_surface == nil and "" or tostring(self.network_controller_surface), {"gui-description.RNS_SurfaceID_tooltip"}, true, true, false, false, false, {ID=self.entID})
        surfID.style.maximal_width = 50

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
		local informationFrame = GuiApi.add_frame(guiTable, "InformationFrame1", mainFrame, "vertical", true)
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
	local textField = guiTable.vars.RNS_SearchTextField

	inventoryScrollPane.clear()
	playerInventoryScrollPane.clear()

	self:createPlayerInventory(guiTable, RNSPlayer, playerInventoryScrollPane, textField.text)

    if self.networkController == nil or not self.networkController.stable or (self.networkController.thisEntity ~= nil and self.networkController.thisEntity.valid == false) then return end
	if self.network_controller_surface == nil or self.thisEntity.surface.index ~= self.network_controller_surface then return end
	if self.network_controller_position.x == nil or self.network_controller_position.y == nil then return end
	if game.surfaces[self.network_controller_surface].find_entity(Constants.NetworkController.main.name, self.network_controller_position) == nil then return end

	if self.networkController:find_wirelessgrid_with_wirelessTransmitter(self.thisEntity.unit_number) == false then
		if justCreated == true then RNSPlayer.thisEntity.print({"gui-description.RNS_NetworkController_Far"}) end
		return
	end

	self:createNetworkInventory(guiTable, RNSPlayer, inventoryScrollPane, textField.text)
end

function WG:createPlayerInventory(guiTable, RNSPlayer, scrollPane, text)
	local tableList = GuiApi.add_table(guiTable, "", scrollPane, 8)
	local inv = {}
	for i = 1, #RNSPlayer.thisEntity.get_main_inventory() do
		local item = RNSPlayer.thisEntity.get_main_inventory()[i]
		if item.count <= 0 then goto continue end
		Util.item_add_list_into_table(inv, Itemstack:new(item))
		::continue::
	end
	local itemIndex = 0
	for _, item in pairs(inv) do
		RNSPlayer.thisEntity.request_translation(Util.get_item_name(item.name))
		if Util.get_item_name(item.name)[1] ~= nil then
			local locName = Util.get_item_name(item.name)[1]
			if text ~= nil and text ~= "" and locName ~= nil and string.match(string.lower(locName), string.lower(text)) == nil then goto continue end
		end
		local buttonText = {"", "[color=blue]", item.extras.label or Util.get_item_name(item.name), "[/color]\n", {"gui-description.RNS_count"}, Util.toRNumber(item.count)}
		if item.health < 1 then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_health"})
			table.insert(buttonText, math.floor(item.health*100) .. "%")
		end
		if item.extras.custom_description ~= "" and item.extras.custom_description ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, item.extras.custom_description)
		elseif item.modified then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_item_modified"})
		end
		
		if item.ammo ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_ammo"})
			table.insert(buttonText, item.ammo .. "/" .. game.item_prototypes[item.name].magazine_size)
		end
		if item.durability ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_durability"})
			table.insert(buttonText, item.durability .. "/" .. game.item_prototypes[item.name].durability)
		end
		if item.connected_entity ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_linked"})
			table.insert(buttonText, item.connected_entity.entity_label or Util.get_item_name(item.connected_entity.name))
		end
		GuiApi.add_button(guiTable, "RNS_WG_PInv_".. itemIndex, tableList, "item/" .. (item.name), "item/" .. (item.name), "item/" .. (item.name), buttonText, 37, false, true, item.count, ((item.modified or (item.ammo and item.ammo < game.item_prototypes[item.name].magazine_size) or (item.durability and item.durability < game.item_prototypes[item.name].durability)) and {Constants.Settings.RNS_Gui.button_2} or {Constants.Settings.RNS_Gui.button_1})[1], {ID=self.thisEntity.unit_number, name=(item.name), stack=item})
		
		itemIndex = itemIndex + 1
		::continue::
	end
end

function WG:createNetworkInventory(guiTable, RNSPlayer, inventoryScrollPane, text)
	local tableList = GuiApi.add_table(guiTable, "", inventoryScrollPane, 8)
	local inv = {}
	local fluid = {}
	for _, priority in pairs(BaseNet.getOperableObjects(self.networkController.network.ItemDriveTable)) do
		for _, drive in pairs(priority) do
			for _, v in pairs(drive.storageArray) do
				Util.item_add_list_into_table(inv, Itemstack:reload(v))
				--local c = Util.itemstack_template(v.name)
				--c.cont.count = v.count
				--if c.cont.ammo then c.cont.ammo = v.ammo end
				--if c.cont.durability then c.cont.durability = v.durability end
				--Util.add_or_merge(c, inv, true)
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
	for _, priority in pairs(self.networkController.network:filter_externalIO_by_valid_signal()) do
		for _, type in pairs(priority) do
			for _, external in pairs(type) do
				if external:interactable() and external:target_interactable() and string.match(external.io, "output") then
					if external.type == "item" and external.focusedEntity.inventory.output.values ~= nil then
						local index = 0
						repeat
							Util.next_index(external.focusedEntity.inventory.output)
							local ii = external.focusedEntity.inventory.output.values[external.focusedEntity.inventory.output.index]
							local inv1 = external.focusedEntity.thisEntity.get_inventory(ii)
							if inv1 ~= nil then
								if BaseNet.inventory_is_sortable(inv1) then inv1.sort_and_merge() end
								for i = 1, #inv1 do
									local itemstack = inv1[i]
									if itemstack.count <= 0 then goto continue end
									Util.item_add_list_into_table(inv, Itemstack:new(itemstack))
									::continue::
								end
							end
							index = index + 1
						until index == external.focusedEntity.inventory.output.max
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
	end
	-----------------------------------------------------------------------------------Fluids----------------------------------------------------------------------------------------
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
	-----------------------------------------------------------------------------------Items----------------------------------------------------------------------------------------
	local itemIndex = 0
	for _, item in pairs(inv) do
		RNSPlayer.thisEntity.request_translation(Util.get_item_name(item.name))
		if Util.get_item_name(item.name)[1] ~= nil then
			local locName = Util.get_item_name(item.name)[1]
			if text ~= nil and text ~= "" and locName ~= nil and string.match(string.lower(locName), string.lower(text)) == nil then goto continue end
		end
		local buttonText = {"", "[color=blue]", item.extras.label or Util.get_item_name(item.name), "[/color]\n", {"gui-description.RNS_count"}, Util.toRNumber(item.count)}
		if item.health < 1 then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_health"})
			table.insert(buttonText, math.floor(item.health*100) .. "%")
		end
		
		if item.extras.custom_description ~= "" and item.extras.custom_description ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, item.extras.custom_description)
		elseif item.modified then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_item_modified"})
		end
		
		if item.ammo ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_ammo"})
			table.insert(buttonText, item.ammo .. "/" .. game.item_prototypes[item.name].magazine_size)
		end
		if item.durability ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_durability"})
			table.insert(buttonText, item.durability .. "/" .. game.item_prototypes[item.name].durability)
		end
		if item.connected_entity ~= nil then
			table.insert(buttonText, "\n")
			table.insert(buttonText, {"gui-description.RNS_linked"})
			table.insert(buttonText, item.connected_entity.entity_label or Util.get_item_name(item.connected_entity.name))
		end
		GuiApi.add_button(guiTable, "RNS_WG_IDInv_".. itemIndex, tableList, "item/" .. (item.name), "item/" .. (item.name), "item/" .. (item.name), buttonText, 37, false, true, item.count, ((item.modified or (item.ammo and item.ammo < game.item_prototypes[item.name].magazine_size) or (item.durability and item.durability < game.item_prototypes[item.name].durability)) and {Constants.Settings.RNS_Gui.button_2} or {Constants.Settings.RNS_Gui.button_1})[1], {ID=self.thisEntity.unit_number, name=(item.name), stack=item})
		itemIndex = itemIndex + 1
		::continue::
	end
end


function WG.transfer_from_pinv(RNSPlayer, WG, tags, count)
	if RNSPlayer.thisEntity == nil or WG == nil then return end
	local network = WG.networkController ~= nil and WG.networkController.network or nil
	if network == nil then return end
	if tags == nil then return end
	local itemstack = Itemstack:reload(tags.stack)
	--if itemstack.id ~= nil and global.itemTable[itemstack.id] ~= nil and global.itemTable[itemstack.id].is_active == true then return end

	if count == -1 then count = game.item_prototypes[itemstack.cont.name].stack_size end
	if count == -2 then count = math.max(1, game.item_prototypes[itemstack.cont.name].stack_size/2) end
	if count == -3 then count = game.item_prototypes[itemstack.cont.name].stack_size*10 end
	if count == -4 then count = (2^32)-1 end

	--local inv = RNSPlayer.thisEntity.get_main_inventory()
	local amount = math.min(itemstack.cont.count, count)
	if amount <= 0 then return end

	BaseNet.transfer_from_inv_to_network(network, {thisEntity = RNSPlayer.thisEntity,inventory = {output = {index = 1, max = 1, values = {defines.inventory.character_main}}}}, itemstack, nil, "whitelist", amount, true, true)
end

function WG.transfer_from_idinv(RNSPlayer, WG, tags, count)
	if RNSPlayer.thisEntity == nil or WG == nil then return end
	local network = WG.networkController ~= nil and WG.networkController.network or nil
	if network == nil then return end
	if tags == nil then return end
	local itemstack = Itemstack:reload(tags.stack)

	if count == -1 then count = game.item_prototypes[itemstack.cont.name].stack_size end
	if count == -2 then count = math.max(1, game.item_prototypes[itemstack.cont.name].stack_size/2) end
	if count == -3 then count = game.item_prototypes[itemstack.cont.name].stack_size*10 end
	if count == -4 then count = (2^32)-1 end

	--local inv = RNSPlayer.thisEntity.get_main_inventory()
	local amount = math.min(itemstack.cont.count, count)
	if amount <= 0 then return end

	BaseNet.transfer_from_network_to_inv(network, {thisEntity = RNSPlayer.thisEntity,inventory = {input = {index = 1, max = 1, values = {defines.inventory.character_main}}}}, itemstack, amount, true, true)
end

function WG.transfer_from_fdinv(RNSPlayer, WG, tags, count)
	if RNSPlayer.thisEntity == nil or WG.networkController == nil then return end
	local network = WG.networkController ~= nil and WG.networkController.network or nil
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

function WG.interaction(event, RNSPlayer)
	if string.match(event.element.name, "RNS_SearchTextField") then return end
	if string.match(event.element.name, "xPos") then
		local obj = global.entityTable[event.element.tags.ID]
		if obj == nil then return end
        if event.element.text ~= "" then
            obj.network_controller_position.x = tonumber(event.element.text)
        else
            obj.network_controller_position.x = nil
        end
		return
	end
    if string.match(event.element.name, "yPos") then
		local obj = global.entityTable[event.element.tags.ID]
		if obj == nil then return end
        if event.element.text ~= "" then
            obj.network_controller_position.y = tonumber(event.element.text)
        else
            obj.network_controller_position.y = nil
        end
		return
	end
	if string.match(event.element.name, "SurfaceID") then
		local obj = global.entityTable[event.element.tags.ID]
		if obj == nil then return end
        if event.element.text ~= "" then
            obj.network_controller_surface = tonumber(event.element.text)
        else
            obj.network_controller_surface = nil
        end
		return
	end

	local count = 0
	if event.button == defines.mouse_button_type.left then count = 1 end --1 Item
	if event.button == defines.mouse_button_type.left and event.shift == true then count = -1 end --1 Stack
	if event.button == defines.mouse_button_type.right then count = -2 end --Half Stack
	if event.button == defines.mouse_button_type.right and event.shift == true then count = -3 end --10 Stacks
	if event.button == defines.mouse_button_type.left and event.control == true then count = -4 end --All Stacks

	if string.match(event.element.name, "RNS_WG_PInv") then
		local obj = global.entityTable[event.element.tags.ID]
		WG.transfer_from_pinv(RNSPlayer, obj, event.element.tags, count)
		return
	end

	if string.match(event.element.name, "RNS_WG_IDInv") then
		local obj = global.entityTable[event.element.tags.ID]
		WG.transfer_from_idinv(RNSPlayer, obj, event.element.tags, count)
		return
	end

	if string.match(event.element.name, "RNS_WG_FDInv") then
		local obj = global.entityTable[event.element.tags.ID]
		WG.transfer_from_fdinv(RNSPlayer, obj, event.element.tags, count)
		return
	end

end