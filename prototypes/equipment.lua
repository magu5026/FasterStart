require ("util")

data:extend(
{
  {
    type = "equipment-category",
    name = "simple-armor"
  },
  {
    type = "equipment-grid",
    name = "simple-equipment-grid",
    width = 6,
    height = 6,
    equipment_categories = {"simple-armor"}
  }
})

simple_power_armor = util.table.deepcopy(data.raw["armor"]["modular-armor"])
simple_power_armor.name = "simple-modular-armor"
simple_power_armor.icon = "__FasterStart__/graphics/icons/simple-power-armor.png"
simple_power_armor.resistances = nil
simple_power_armor.order = "c"
simple_power_armor.equipment_grid = "simple-equipment-grid"
simple_power_armor.hidden_in_factoriopedia = true

simple_fission_reactor_equipment = util.table.deepcopy(data.raw["generator-equipment"]["fission-reactor-equipment"])
simple_fission_reactor_equipment.name = "simple-fission-reactor-equipment"
simple_fission_reactor_equipment.power = "110kW"
simple_fission_reactor_equipment.categories = {"simple-armor"}

simple_fission_reactor_item = util.table.deepcopy(data.raw["item"]["fission-reactor-equipment"])
simple_fission_reactor_item.name = "simple-fission-reactor-equipment"
simple_fission_reactor_item.place_as_equipment_result = "simple-fission-reactor-equipment"
simple_fission_reactor_item.order = "a[energy-source]-b"
simple_fission_reactor_item.hidden_in_factoriopedia = true

simple_exoskeleton_equipment = util.table.deepcopy(data.raw["movement-bonus-equipment"]["exoskeleton-equipment"])
simple_exoskeleton_equipment.name = "simple-exoskeleton-equipment"
simple_exoskeleton_equipment.shape.height = 6
simple_exoskeleton_equipment.energy_consumption = "100kW"
simple_exoskeleton_equipment.movement_bonus = 0.15
simple_exoskeleton_equipment.categories = {"simple-armor"}

simple_exoskeleton_item = util.table.deepcopy(data.raw["item"]["exoskeleton-equipment"])
simple_exoskeleton_item.name = "simple-exoskeleton-equipment"
simple_exoskeleton_item.place_as_equipment_result = "simple-exoskeleton-equipment"
simple_exoskeleton_item.order = "d[exoskeleton]-a"
simple_exoskeleton_item.hidden_in_factoriopedia = true

data:extend(
{
  simple_power_armor,
  simple_fission_reactor_equipment,
  simple_fission_reactor_item,
  simple_exoskeleton_equipment,
  simple_exoskeleton_item
})
