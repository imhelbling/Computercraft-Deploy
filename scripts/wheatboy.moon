search_inv = (item, action, should_break) ->
	for i=1,16
			turtle.select i

			if turtle.getItemDetail i == item
				if action == "place down"
					unless turtle.detectDown!
						turtle.placeDown!

				if action == "drop all down"
					turtle.dropDown!

				if action == "drop half forward"
					turtle.drop(turtle.getItemCount i / 2)

				if action == "refuel"
					turtle.refuel!

				if should_break
					break



refuel = ->
	turtle.suckUp!
	search_inv "minecraft:coal", "refuel", true



pit_stop = ->
	search_inv "minecraft:wheat", "drop all down", false

	search_inv "minecraft:seeds", "drop half forward", false

	refuel!

	turtle.turnLeft!
	turtle.turnLeft!



check_wheat = ->
	if block.name == "minecraft:wheat" and block.metadata == 7
	if block.metadata == 7

		print "Harvesting wheat."
		turtle.digDown!



plant_seed = ->
	print "Searching inventory for seeds..."
	search_inv "minecraft:wheat_seeds", "place down", true



move = ->
	success, block = turtle.inspect!
	
	unless turtle.detect!
		turtle.forward!
	
	if block.name == "minecraft:stone" and block.metadata == 3
		turtle.turnRight!
	
	if block.name == "minecraft:stone" and block.metadata == 5
		turtle.turnLeft
	
	if block.name == "minecraft:stone" and block.metadata == 1
		turtle.turnLeft!
		turtle.turnLeft!
	
	if block.name == "minecraft:chest"
		pit_stop!



success, block = turtle.inspectDown!

while true
	check_wheat!
	
	unless turtle.detectDown!
		plant_seed!

	move!