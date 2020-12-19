require("fusion-construction-robot") 

data:extend(
{
	{
        type = "equipment-grid",
		name = "mini-equipment-grid",
		width = 6,
		height = 4,
		equipment_categories = {"armor"}
	},
	
	{
		type = "item",
		name = "fusion-construction-robot",
		icon = "__FasterStart__/graphics/icons/fusion-construction-robot.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "logistic-network",
		order = "a[robot]-b[construction-robot]-a[fusion-construction-robot]",
		place_result = "fusion-construction-robot",
		stack_size = 50
	},
	
	{
		type = "item",
		name = "mini-fusion-reactor-equipment",
		icons = 
		{{
			icon = "__base__/graphics/icons/fusion-reactor-equipment.png",
			tint = {r=0.53, g=0.81, b=0.92, a=1}
		}},		
		icon_size = 64,
		icon_mipmaps = 4,
		placed_as_equipment_result = "mini-fusion-reactor-equipment",
		subgroup = "equipment",
		order = "a[energy-source]-b[fusion-reactor]-a[mini-fusion-reactor-equipment]",
		stack_size = 20
	},
	
	{
		type = "armor",
		name = "mini-power-armor",
		icon = "__FasterStart__/graphics/icons/mini-power-armor.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "armor",
		order = "c[modular-armor]-a[mini-power-armor]",
		stack_size = 1,
		infinite = true,
		equipment_grid = "mini-equipment-grid",
		inventory_size_bonus = 10
	},
	
	{
		type = "generator-equipment",
		name = "mini-fusion-reactor-equipment",
		sprite =
		{
			filename = "__FasterStart__/graphics/equipment/mini-fusion-reactor-equipment.png",
			width = 65,
			height = 128,
			priority = "medium"
		},
		shape =
		{
			width = 2,
			height = 4,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "primary-output"
		},
		power = "250kW",
		categories = {"armor"}
	}
})