local util_lib = require("util_lib")

local armor_name = "simple-modular-armor"
local robot_name = "fission-construction-robot"

local check_player = function(player_index)
  player = game.get_player(player_index)
  found = util_lib.table.contains(storage.player_list, player)
  
  if not found then
    return player
  else
    return nil
  end
end

local inventory_insert_item = function(inventory, item_name, item_count)
  inventory.insert({name = item_name, count = item_count or 1})
  return inventory.find_item_stack(item_name)
end

local add_equipment = function(grid, equipment_name)
  equipment = grid.put({name = equipment_name})
  equipment.energy = equipment.max_energy
end

local add_armor = function(player_index)
  player = check_player(player_index)
  if not player or not player.valid then return end
  
  character = player.cutscene_character or player.character or nil
  if not character or not character.valid then return end
  
  armor_inventory = character.get_inventory(defines.inventory.character_armor)
  player_inventory = character.get_main_inventory()
  
  if armor_inventory.get_item_count(armor_name) > 0 or player_inventory.get_item_count(robot_name) > 0 then
    table.insert(storage.player_list, player)
    return
  end
  
  if armor_inventory.is_empty() then
    armor = inventory_insert_item(armor_inventory, armor_name)
  else
    armor = inventory_insert_item(player_inventory, armor_name)
  end
  
  add_equipment(armor.grid, "simple-exoskeleton-equipment")
  add_equipment(armor.grid, "simple-fission-reactor-equipment")
  add_equipment(armor.grid, "personal-roboport-equipment")
  add_equipment(armor.grid, "night-vision-equipment")
  
  inventory_insert_item(player_inventory, robot_name, 10)
  table.insert(storage.player_list, player)
end

local on_player_joined_game = function(event)
  if not storage.freeplay then return end
  add_armor(event.player_index)
end

local faster_start = {}

faster_start.events = {
  [defines.events.on_player_joined_game] = on_player_joined_game
}

--faster_start.on_configuration_changed = function()
--	storage.player_list = storage.player_list or {}
--	storage.freeplay = storage.freeplay or false
--	storage.disable_crashsite = settings.startup['disable-crashsite'].value
--	storage.skip_intro = settings.startup['skip-intro'].value
--end

faster_start.on_init = function()
  storage.player_list = {}
  storage.freeplay = false
  storage.disable_crashsite = settings.startup["disable-crashsite"].value
  storage.skip_intro = settings.startup["skip-intro"].value
  
  if remote.interfaces["freeplay"] then
    storage.freeplay = true
    remote.call("freeplay", "set_disable_crashsite", storage.disable_crashsite)
    remote.call("freeplay", "set_skip_intro", storage.skip_intro)
  end
end

return faster_start
