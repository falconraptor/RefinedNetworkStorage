local controllerI = {}
controllerI.type = "item"
controllerI.name = Constants.NetworkController.name
controllerI.icon = Constants.NetworkController.itemIcon
controllerI.icon_size = 256
controllerI.subgroup = Constants.ItemGroup.Category.subgroup
controllerI.order = "n"
controllerI.stack_size = 20
controllerI.place_result = Constants.NetworkController.name
data:extend{controllerI}

local controllerR = {}
controllerR.type = "recipe"
controllerR.name = Constants.NetworkController.name
controllerR.energy_required = 1
controllerR.enabled = true
controllerR.ingredients = {}
controllerR.result = Constants.NetworkController.name
controllerR.result_count = 1
data:extend{controllerR}

local controllerE = {}
controllerE.type = "electric-energy-interface"
controllerE.name = Constants.NetworkController.name
controllerE.icon = Constants.NetworkController.itemIcon
controllerE.icon_size = 256
controllerE.flags = {"placeable-neutral", "player-creation"}
controllerE.minable = {mining_time = 0.2, result = Constants.NetworkController.name}
controllerE.max_health = 350
controllerE.corpse = "medium-remnants"
controllerE.collision_box = {{-2.5, -2.5}, {2.5, 2.5}}
controllerE.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
controllerE.open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" }
controllerE.close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" }
controllerE.vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 }
controllerE.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    buffer_capacity = "1J" --1 Joule is 50 Watts
}
controllerE.energy_usage = "0W"
controllerE.picture =
    {
        layers =
        {
            {
                filename = Constants.NetworkController.entityE,
                priority = "extra-high",
                width = 256,
                height = 256,
                shift = {0,-5/4},
                scale = 5/4
            },
            {
                filename = Constants.NetworkController.entityS,
                priority = "high",
                width = 256,
                height = 256,
                shift = {5/2,-5/4},
                draw_as_shadow = true,
                scale = 5/4
            }
        }
    }
data:extend{controllerE}