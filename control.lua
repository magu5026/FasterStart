function ON_INIT()
	global.FasterStart = global.FasterStart or {}
	global.FasterStart.PlayerList = global.FasterStart.PlayerList or {}
		
	for _,player in pairs(game.players) do
		create_armor(player)
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

script.on_init(ON_INIT)
script.on_event({on_player_joined_game,defines.events.on_player_created},GIVE_ITEM)