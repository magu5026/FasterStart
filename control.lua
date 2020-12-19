require("lib")

local modName = "FasterStart"

function Init()
	global = {}
	global.PlayerList = {}
end

function CheckAllPlayers()
	for _,player in pairs(game.players) do
		if player and player.connected then
			GiveArmor(player)		
		end
	end
end

function OnInit()
	Init()
	CheckAllPlayers()
	
	if remote.interfaces["freeplay"] then
		remote.call("freeplay", "set_disable_crashsite", settings.startup['disable-crashsite'].value)
		remote.call("freeplay", "set_skip_intro", settings.startup['skip-intro'].value)
		
		if not settings.startup['disable-crashsite'].value then 
			local ship_items = remote.call("freeplay", "get_ship_items")
			ship_items['fusion-construction-robot'] = (ship_items['fusion-construction-robot'] or 0) + 25
		
			local debris_items = remote.call("freeplay", "get_debris_items")
			debris_items['mini-power-armor'] = (debris_items['mini-power-armor'] or 0) + 1 
			debris_items['mini-fusion-reactor-equipment'] = (debris_items['mini-fusion-reactor-equipment'] or 0) + 1 
			debris_items['night-vision-equipment'] = (debris_items['night-vision-equipment'] or 0) + 1 
			debris_items['exoskeleton-equipment'] = (debris_items['exoskeleton-equipment'] or 0) + 1 
			debris_items['personal-roboport-mk2-equipment'] = (debris_items['personal-roboport-mk2-equipment'] or 0) + 1 
			
			remote.call("freeplay", "set_ship_items", ship_items)
			remote.call("freeplay", "set_debris_items", debris_items)
		end	
	end
end
script.on_init(OnInit)

function OnConfigurationChanged(data)
	if IsModChanged(data,modName) then
		local oldVersion = GetOldVersion(data,modName)
		-- if oldVersion < "00.17.05" or data.mod_changes[modName].old_version == "0.17.201" then
			-- Init()
			-- CheckAllPlayers()
		-- end	
	end
end	
--script.on_configuration_changed(OnConfigurationChanged)

function OnPlayerSpawned(event)
	local player = game.get_player(event.player_index)
	GiveArmor(player)
end	
script.on_event({defines.events.on_player_joined_game,defines.events.on_player_created,},OnPlayerSpawned)

function GiveArmor(player)
	if Contains(global.PlayerList,player) then return end
	if (player.controller_type ~= defines.controllers.character) then return end
	
	local armor_inventory = player.character.get_inventory(defines.inventory.character_armor)
	local player_inventory = player.character.get_inventory(defines.inventory.character_main)
	
	if (armor_inventory.get_item_count("mini-power-armor") > 0 or player_inventory.get_item_count("fusion-construction-robot") > 0) then
		table.insert(global.PlayerList,player)
		return
	end
		
	local contents = armor_inventory.get_contents()
	local armor
		
	if Count(contents) > 0 then 
		player_inventory.insert({name="mini-power-armor"})
		armor = player_inventory.find_item_stack("mini-power-armor")
	else
		armor_inventory.insert({name="mini-power-armor"})
		armor = armor_inventory.find_item_stack("mini-power-armor")
	end
	
	local a_grid = armor.grid
		a_grid.put({name = "mini-fusion-reactor-equipment"})
		a_grid.put({name = "night-vision-equipment"})
		a_grid.put({name = "exoskeleton-equipment"})
		a_grid.put({name = "personal-roboport-mk2-equipment"})
	player_inventory.insert{name="fusion-construction-robot", count = 25}
			
	table.insert(global.PlayerList,player)
end