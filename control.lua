script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	if not (player.character and player.get_inventory(defines.inventory.player_armor)) then return end
	player.insert{name="mini-power-armor", count = 1}
	local A_Grid = player.get_inventory(defines.inventory.player_armor)[1].grid
		  A_Grid.put({name = "mini-fusion-reactor-equipment"})
		  A_Grid.put({name = "night-vision-equipment"})
		  A_Grid.put({name = "exoskeleton-equipment"})
		  A_Grid.put({name = "personal-roboport-mk2-equipment"})
	player.insert({name="fusion-construction-robot", count = 25})
end)