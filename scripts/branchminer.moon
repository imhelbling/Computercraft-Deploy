-- 3 units of fuel consumed for each 1 meter of length of tunnel

ores = {
	"minecraft:coal_ore"
	"minecraft:iron_ore"
	"minecraft:gold_ore"
	"minecraft:redstone_ore"
	"minecraft:lit_redstone_ore"
	"minecraft:lapis_ore"
	"minecraft:diamond_ore"
	"minecraft:emerald_ore"
	"minecraft:quartz_ore"
}
 
branch_length = 5

distance_x = 0
distance_y = 0
following_y = true
following_x = false

main_length = 0

min_fuel = (distance_x + distance_y) * 1.25

at_station = ->
	success, block = turtle.inspect!
	if block.data == "minecraft:chest"
		return true
	return false

enough_fuel = ->
    --print "Checking fuel..."
	if turtle.getFuelLevel! >= min_fuel 
        return true
    print "Fuel low!"
    return false

refuel = ->
	turtle.suck!
	turtle.refuel!


table_contains = (table, element) ->
  for _, value in pairs(table)
    if value == element
      return true
  return false

turn_left = ->
	turtle.turnLeft!

	following_y = false
	following_x = true

turn_right = ->
	turtle.turnRight!

	following_y = true
	following_x = false
	

go_forward = ->
	turtle.forward!

	if following_y
		distance_y += 1

	if following_x
		distance_x += 1

go_back = ->
	turtle.back!

	if following_y
		distance_y -= 1

	if following_x
		distance_x -= 1

dump_inv = ->
	print "Dumping inventory..."
    for i=1,16
        turtle.select i
        turtle.dropDown!
    turtle.select(1)

pit_stop = ->
	if following_y
		for i=1,distance_y
			turtle.back!
	elseif following_x
		for i=1,distance_x
			turtle.back!
		turn_right!

	turtle.turnLeft!
	turtle.turnLeft!
	if at_station!
		dump_inv!
		refuel!
	turtle.turnLeft!
	turtle.turnLeft!

	for i=1,distance_y
			turtle.forward!
	turn_left!
	for i=1,distance_x
			turtle.forward!





tunnel = ->
		turtle.dig!
		go_forward!
		if following_y
			main_length += 1
		turtle.digUp!

search = ->
	success, block = turtle.inspectDown!
	if table_contains(ores, block.name)
		print "Found ore!"
		turtle.digDown!

	turtle.turnRight!
	success, block = turtle.inspect!
	if table_contains(ores, block.name)
		print "Found ore!"
		turtle.dig!

	turtle.up!
	success, block = turtle.inspect!
	if table_contains(ores, block.name)
		print "Found ore!"
		turtle.dig!

	success, block = turtle.inspectUp!
	if table_contains(ores, block.name)
		print "Found ore!"
		turtle.digUp!

	turtle.turnLeft!
	turtle.turnLeft!
	success, block = turtle.inspect!
	if table_contains(ores, block.name)
		print "Found ore!"
		turtle.dig!

	turtle.down!
	success, block = turtle.inspect!
	if table_contains(ores, block.name)
		print "Found ore!"
		turtle.dig!

	turtle.turnRight!


new_branch = ->
	--if main_length < 1
	for i=0,main_length
		go_forward!

	-- digging main tunnel
	for i=1,3
		if enough_fuel!
			tunnel!
			search!
		else 
			pit_stop!
	turn_left!

	-- digging branch
	for i=1,branch_length
		if enough_fuel!
			tunnel!
			search!
		else 
			pit_stop!

go_to_station = ->
	-- return to station
	if following_y
		for i=1,distance_y
			turtle.back!
	elseif following_x
		for i=1,distance_x
			turtle.back!
		turn_right!

	distance_x = 0
	distance_y = 0

	turtle.turnLeft!
	turtle.turnLeft!
	if at_station!
		dump_inv!
		refuel!
	turtle.turnLeft!
	turtle.turnLeft!




running = true

while running
	new_branch!
	go_to_station!
