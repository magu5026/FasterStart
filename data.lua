data:extend(
{
	{
        type = "equipment-grid",
		name = "mini-equipment-grid",
		width = 6,
		height = 4,
		equipment_categories = {"armor"}
	}
})


local fusion_robot_item = table.deepcopy(data.raw['item']['construction-robot'])
fusion_robot_item.name = "fusion-construction-robot"
fusion_robot_item.icon = "__FasterStart__/graphics/icons/fusion-construction-robot.png"
fusion_robot_item.place_result = "fusion-construction-robot"


local mini_fusion_reactor_item = table.deepcopy(data.raw['item']['fusion-reactor-equipment'])
mini_fusion_reactor_item.name = "mini-fusion-reactor-equipment"
mini_fusion_reactor_item.icon = "__FasterStart__/graphics/icons/mini-fusion-reactor-equipment.png"
mini_fusion_reactor_item.placed_as_equipment_result = "mini-fusion-reactor-equipment"


local mini_armor = table.deepcopy(data.raw['armor']['modular-armor'])
mini_armor.name = "mini-power-armor"
mini_armor.icon = "__FasterStart__/graphics/icons/mini-power-armor.png"
mini_armor.resistances = {}
mini_armor.durability = 5000
mini_armor.equipment_grid = "mini-equipment-grid"


local mini_fusion_reactor = table.deepcopy(data.raw['generator-equipment']['fusion-reactor-equipment'])
mini_fusion_reactor.name = "mini-fusion-reactor-equipment"
mini_fusion_reactor.sprite.filename = "__FasterStart__/graphics/equipment/mini-fusion-reactor-equipment.png"
mini_fusion_reactor.sprite.width = 65
mini_fusion_reactor.shape.width = 2
mini_fusion_reactor.power = "250kW"


local fusion_robot = table.deepcopy(data.raw['construction-robot']['construction-robot'])
fusion_robot.name = "fusion-construction-robot"
fusion_robot.icon = "__FasterStart__/graphics/icons/fusion-construction-robot.png"
fusion_robot.minable.result = "fusion-construction-robot"
fusion_robot. energy_per_tick = "0kJ"
fusion_robot.energy_per_move = "0kJ"
fusion_robot.idle.filename = "__FasterStart__/graphics/entity/construction-robot-nuclear.png"
fusion_robot.idle.hr_version.filename = "__FasterStart__/graphics/entity/hr-construction-robot.png"
fusion_robot.in_motion.filename = "__FasterStart__/graphics/entity/construction-robot-nuclear.png"
fusion_robot.in_motion.hr_version.filename = "__FasterStart__/graphics/entity/hr-construction-robot.png"
fusion_robot.shadow_idle.filename = "__FasterStart__/graphics/entity/construction-robot-nuclear-shadow.png"
fusion_robot.shadow_idle.hr_version.filename = "__FasterStart__/graphics/entity/hr-construction-robot-shadow.png"
fusion_robot.shadow_in_motion.filename = "__FasterStart__/graphics/entity/construction-robot-nuclear-shadow.png"
fusion_robot.shadow_in_motion.hr_version.filename = "__FasterStart__/graphics/entity/hr-construction-robot-shadow.png"
fusion_robot.working.filename = "__FasterStart__/graphics/entity/construction-robot-nuclear-working.png"
fusion_robot.working.hr_version.filename = "__FasterStart__/graphics/entity/hr-construction-robot-working.png"
fusion_robot.shadow_working.stripes = 
	util.multiplystripes(2, 
		{
			{
				filename = "__FasterStart__/graphics/entity/construction-robot-nuclear-shadow.png",
				width_in_frames = 16,
				height_in_frames = 1,
			}
		})
		
		
data:extend({fusion_robot_item,mini_fusion_reactor_item,mini_armor,mini_fusion_reactor,fusion_robot})
