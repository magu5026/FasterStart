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
script.on_event({on_player_joined_game,defines.events.on_player_created},OnPlayerSpawned)

function GiveArmor(player)
	if Contains(global.PlayerList,player) then return end
	
	local armor_inventory = player.get_inventory(defines.inventory.character_armor)
	local player_inventory = player.get_inventory(defines.inventory.character_main)
	
	if (not player.character or not armor_inventory) then return end
	
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