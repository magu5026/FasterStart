data:extend(
{
	{
		type = "item",
		name = "fusion-construction-robot",
		icon = "__FasterStart__/graphics/icons/fusion-construction-robot.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "logistic-network",
		order = "a[robot]-b[construction-robot]",
		place_result = "fusion-construction-robot",
		stack_size = 25
	},

	{
		type = "item",
		name = "mini-fusion-reactor-equipment",
		icon = "__FasterStart__/graphics/icons/mini-fusion-reactor-equipment.png",
		placed_as_equipment_result = "mini-fusion-reactor-equipment",
		flags = {"goes-to-main-inventory"},
		subgroup = "equipment",
		order = "a[energy-source]-b[fusion-reactor]",
		stack_size = 1
	},
	
	{
        type = "equipment-grid",
		name = "mini-equipment-grid",
		width = 6,
		height = 4,
		equipment_categories = {"armor"}
	},
})

local mini_armor = table.deepcopy(data.raw['armor']['modular-armor'])
mini_armor.name = "mini-power-armor"
mini_armor.icon = "__FasterStart__/graphics/icons/mini-power-armor.png"
mini_armor.resistances = {}
mini_armor.durability = 5000
mini_armor.equipment_grid = "mini-equipment-grid"


local mini_reactor = table.deepcopy(data.raw['generator-equipment']['fusion-reactor-equipment'])
mini_reactor.name = "mini-fusion-reactor-equipment"
mini_reactor.sprite =
    {
      filename = "__FasterStart__/graphics/equipment/mini-fusion-reactor-equipment.png",
      width = 65,
      height = 128,
      priority = "medium"
    }
mini_reactor.shape =
    {
      width = 2,
      height = 4,
      type = "full"
    }
mini_reactor.power = "250kW"


local fcr = table.deepcopy(data.raw['construction-robot']['construction-robot'])
fcr.name = "fusion-construction-robot"
fcr.icon = "__FasterStart__/graphics/icons/fusion-construction-robot.png"
fcr.minable = {hardness = 0.1, mining_time = 0.1, result = "fusion-construction-robot"}
fcr. energy_per_tick = "0kJ"
fcr.energy_per_move = "0kJ"
fcr.idle = 
		{
            filename = "__FasterStart__/graphics/entity/construction-robot-nuclear.png",
            priority = "high",
            line_length = 16,
            width = 32,
            height = 36,
            frame_count = 1,
            shift = {0, -0.15625},
            direction_count = 16
        }
fcr.in_motion = 
		{
            filename = "__FasterStart__/graphics/entity/construction-robot-nuclear.png",
            priority = "high",
            line_length = 16,
            width = 32,
            height = 36,
            frame_count = 1,
            shift = {0, -0.15625},
            direction_count = 16,
            y = 36
        }
fcr.shadow_idle = 
		{
            filename = "__FasterStart__/graphics/entity/construction-robot-nuclear-shadow.png",
            priority = "high",
            line_length = 16,
            width = 50,
            height = 24,
            frame_count = 1,
            shift = {1.09375, 0.59375},
            direction_count = 16
        }
fcr.shadow_in_motion = 
		{
            filename = "__FasterStart__/graphics/entity/construction-robot-nuclear-shadow.png",
            priority = "high",
            line_length = 16,
            width = 50,
            height = 24,
            frame_count = 1,
            shift = {1.09375, 0.59375},
            direction_count = 16
        }
fcr.working = 
		{
            filename = "__FasterStart__/graphics/entity/construction-robot-nuclear-working.png",
            priority = "high",
            line_length = 2,
            width = 28,
            height = 36,
            frame_count = 2,
            shift = {0, -0.15625},
            direction_count = 16,
            animation_speed = 0.3,
        }
fcr.shadow_working = 
		{
            stripes = util.multiplystripes(2, {
                {
                    filename = "__FasterStart__/graphics/entity/construction-robot-nuclear-shadow.png",
                    width_in_frames = 16,
                    height_in_frames = 1,
                }
            }),
            priority = "high",
            width = 50,
            height = 24,
            frame_count = 2,
            shift = {1.09375, 0.59375},
            direction_count = 16
        }
		
		
data:extend({mini_armor,mini_reactor,fcr})
