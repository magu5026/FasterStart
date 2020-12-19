local fusion_robot = table.deepcopy(data.raw['construction-robot']['construction-robot'])
fusion_robot.name = "fusion-construction-robot"
fusion_robot.icon = "__FasterStart__/graphics/icons/fusion-construction-robot.png"
fusion_robot.minable.result = "fusion-construction-robot"
fusion_robot. energy_per_tick = "0kJ"
fusion_robot.energy_per_move = "0kJ"
fusion_robot.idle.filename = "__FasterStart__/graphics/entity/fusion-construction-robot.png"
fusion_robot.idle.hr_version.filename = "__FasterStart__/graphics/entity/hr-fusion-construction-robot.png"
fusion_robot.in_motion.filename = "__FasterStart__/graphics/entity/fusion-construction-robot.png"
fusion_robot.in_motion.hr_version.filename = "__FasterStart__/graphics/entity/hr-fusion-construction-robot.png"
fusion_robot.shadow_idle.filename = "__FasterStart__/graphics/entity/fusion-construction-robot-shadow.png"
fusion_robot.shadow_idle.hr_version.filename = "__FasterStart__/graphics/entity/hr-fusion-construction-robot-shadow.png"
fusion_robot.shadow_in_motion.filename = "__FasterStart__/graphics/entity/fusion-construction-robot-shadow.png"
fusion_robot.shadow_in_motion.hr_version.filename = "__FasterStart__/graphics/entity/hr-fusion-construction-robot-shadow.png"
fusion_robot.working.filename = "__FasterStart__/graphics/entity/fusion-construction-robot-working.png"
fusion_robot.working.hr_version.filename = "__FasterStart__/graphics/entity/hr-fusion-construction-robot-working.png"
		
		
data:extend({fusion_robot})