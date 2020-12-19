local MODNAME = "FasterStart"

local function Init()
	global.FasterStart = global.FasterStart or {}
	global.FasterStart.PlayerList = global.FasterStart.PlayerList or {}
end

function ON_INIT()
	Init()
			
	for _,player in pairs(game.players) do
		create_armor(player)
	end
end

function ON_CONFIGURATION_CHANGED(data)
	Init()
	
	if NeedMigration(data,MODNAME) then
		local old_version = GetOldVersion(data,MODNAME)
		if old_version < "00.16.03" then
			for _,player in pairs(game.players) do
				if player.character then
					local player_armor = player.get_inventory(defines.inventory.player_armor)
					local player_main = player.get_inventory(defines.inventory.player_main)
					if (player_armor.find_item_stack("mini-power-armor") or player_main.find_item_stack("fusion-construction-robot")) then
						table.insert(global.FasterStart.PlayerList,player)
					else
						create_armor(player)
					end				
				end
			end
		end
	end
end	

function GIVE_ITEM(event)
	local player = game.players[event.player_index]
	create_armor(player)
end	

function create_armor(player)
	if Exists(player) then return end
	if (not player.character or not player.get_inventory(defines.inventory.player_armor)) then return end
	
	player.insert{name="mini-power-armor", count = 1}
	local A_Grid = player.get_inventory(defines.inventory.player_armor)[1].grid
		  A_Grid.put({name = "mini-fusion-reactor-equipment"})
		  A_Grid.put({name = "night-vision-equipment"})
		  A_Grid.put({name = "exoskeleton-equipment"})
		  A_Grid.put({name = "personal-roboport-mk2-equipment"})
	player.insert{name="fusion-construction-robot", count = 25}
		
	table.insert(global.FasterStart.PlayerList,player)
end

function Exists(player)
	for _,item in pairs(global.FasterStart.PlayerList) do
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

script.on_init(ON_INIT)
script.on_configuration_changed(ON_CONFIGURATION_CHANGED)
script.on_event({on_player_joined_game,defines.events.on_player_created},GIVE_ITEM)