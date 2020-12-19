local MODNAME = "FasterStart"

function init()
	global.PlayerList = global.PlayerList or {}
end

function ON_INIT()
	init()

	for _,player in pairs(game.players) do
		if player and player.connected then
			create_armor(player)
		end
	end
end

function ON_CONFIGURATION_CHANGED(data)
	init()

	if NeedMigration(data,MODNAME) then
		local old_players = global.FasterStart.PlayerList
		global = {}
		global.PlayerList = old_players
	end
end	

function GIVE_ITEM(event)
	local player = game.players[event.player_index]
	create_armor(player)
end	

function create_armor(player)
	if Exists(player) then return end
	
	local armor_inventory = player.get_inventory(defines.inventory.player_armor)
	local player_inventory = player.get_inventory(defines.inventory.player_main)
	
	if (not player.character or not armor_inventory) then return end
	
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

function Exists(player)
	for _,item in pairs(global.PlayerList) do
		if item == player then return true end
	end
	return false
end

function NeedMigration(data,modname)
	if data 
	 and data.mod_changes 
	 and data.mod_changes[modname] 
	 and data.mod_changes[modname].old_version then 
		return true 
	end
	return false
end

function GetOldVersion(data,modname)
	return FormatVersion(data.mod_changes[modname].old_version)
end

function FormatVersion(version)
	return string.format("%02d.%02d.%02d", string.match(version, "(%d+).(%d+).(%d+)"))
end

function Count(list)
	local i = 0
	for _ in pairs(list) do
		i = i + 1
	end
	return i
end

script.on_init(ON_INIT)
script.on_configuration_changed(ON_CONFIGURATION_CHANGED)
script.on_event({on_player_joined_game,defines.events.on_player_created},GIVE_ITEM)