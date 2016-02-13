instructions = [[

WOOD PHASE


	fill inv with logs

	go up, up, left

	dump portion of wood into right hopper

	go left, fwd, right

	dump portion of wood into left hopper

	go down, down, right, fwd

	dump remaining wood into output




COAL PHASE


	go left

	fill inv with coal

	check own fuel level 

	go left up

	refill right furnace

	go left, fwd, right 

	refill left furnace

	go left, fwd, left

	put portion of fuel into collector chest

	go left, fwd, fwd, right

	put portion of fuel into harvester chest

	go left, down

	dump remaining coal into ouptut

]]

-- wood distribution

right_hopper_portion = 28

left_hopper_portion = 28

-- remaining 8 units goes to output



-- coal distribution

collector_portion = 16

harvester_portion = 16

-- remaining 32 units goes to output



check_fuel = ->
    print "Checking fuel level..."
	if turtle.getFuelLevel! < 100
        print "Fuel low, refueling..."
        turtle.refuel 10
    print("Fuel level: ", turtle.getFuelLevel!)



tally_items = ->
	slot_count = turtle.getItemCount!
	if slot_count == nil
		slot_count = 0

	for i=1,16
		turtle.select i
		tally += slot_count
	return tally



fill_inv = (direction) ->
	for i=1,16
		turtle.select i

		if direction == "up"
			turtle.suckUp!

		elseif direction == "forward"
			turtle.suck!

		elseif direction == "down"
			turtle.suckDown!



portion_dump = (amount) ->
	amount_to_dump = amount
	for i=1,16
		turtle.select i 

		if amount_to_dump < 1
					break

		slot_count = turtle.getItemCount!
		if slot_count == nil
			slot_count = 0

		if slot_count > 0
			

			for i=1,slot_count
				turtle.drop(1)
				amount_to_dump -= 1

				if amount_to_dump < 1
					break




fill_furnace = ->
	for i=1,16
		turtle.select i
		if turtle.getItemDetail == "minecraft:coal"
			turtle.drop!



wood_phase = ->
	
	fill_inv "down" 
	tally = tally_items!

	--go up, up, left
	turtle.up!
	turtle.up!
	turtle.turnLeft!

	portion_dump (tally! * (28/64))

	--go left, fwd, right
	turtle.turnLeft!
	turtle.forward!
	turtle.turnRight!

	portion_dump (tally! * (28/64))

	--go down, down, right, fwd
	turtle.down!
	turtle.down!
	turtle.turnRight!
	turtle.forward!

	portion_dump (tally! * (64/64))



coal_phase = ->
	turtle.turnLeft!

	fill_inv "forward" 
	check_fuel!

	--go left, up
	turtle.turnLeft!
	turtle.up!

	fill_furnace!

	--go left, fwd, right 
	turtle.turnLeft!
	turtle.forward!
	turtle.turnRight!

	fill_furnace!

	tally = tally_items!

	--go left, fwd, left
	turtle.turnLeft!
	turtle.forward!
	turtle.turnLeft!

	portion_dump (tally! * (16/64))

	--go left, fwd, fwd, right
	turtle.turnLeft!
	turtle.forward!
	turtle.forward!
	turtle.turnRight!

	portion_dump (tally! * (16/64))

	--go left, down
	turtle.turnLeft!
	turtle.down!

	portion_dump (tally! * (64/64))



while true
	wood_phase!
	coal_phase!