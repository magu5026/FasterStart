local add_equipment = function(grid, equipment_name)
  local equipment = grid.put({ name = equipment_name })
  equipment.energy = equipment.max_energy
end

for i, p in pairs(game.players) do
  local character = p.cutscene_character or p.character or nil
  if not character or not character.valid then goto continue end

  local armor_inventory = character.get_inventory(defines.inventory.character_armor)
  local armor = armor_inventory.find_item_stack("simple-modular-armor")
  if armor and armor.valid then
    armor.grid.clear()
    add_equipment(armor.grid, "simple-exoskeleton-equipment")
    add_equipment(armor.grid, "simple-fission-reactor-equipment")
    add_equipment(armor.grid, "personal-roboport-equipment")
    add_equipment(armor.grid, "night-vision-equipment")
  end

  ::continue::
end
