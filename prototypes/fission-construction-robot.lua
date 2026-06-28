require ("util")

local fission_robot = util.table.deepcopy(data.raw['construction-robot']['construction-robot'])
fission_robot.name = "fission-construction-robot"
fission_robot.icon = "__FasterStart__/graphics/icons/fission-construction-robot.png"
fission_robot.minable.result = "fission-construction-robot"
fission_robot.healing_per_tick = 10
fission_robot.max_health = 1000
fission_robot.energy_per_tick = "0kJ"
fission_robot.energy_per_move = "0kJ"
fission_robot.idle.filename = "__FasterStart__/graphics/entity/fission-construction-robot.png"
fission_robot.in_motion.filename = "__FasterStart__/graphics/entity/fission-construction-robot.png"
fission_robot.working.filename = "__FasterStart__/graphics/entity/fission-construction-robot-working.png"
fission_robot.hide_resistances = true
	
data:extend({fission_robot})

data:extend(
{
	{
		type = "item",
		name = "fission-construction-robot",
		icon = "__FasterStart__/graphics/icons/fission-construction-robot.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "logistic-network",
		order = "a[robot]-b[construction-robot]-a[fission-construction-robot]",
		place_result = "fission-construction-robot",
		stack_size = 50,
		hidden_in_factoriopedia = true,
	}
})