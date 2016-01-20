check_fuel = ->
    print "Checking fuel..."
	if turtle.getFuelLevel! < 500
        print "Fuel low, refueling..."
        turtle.suckUp!
        turtle.refuel!
    print("Fuel level: ", turtle.getFuelLevel!)

get_saplings = ->
    print "Grabbing some saplings..."
    turtle.select(16)
    turtle.suck(64 - turtle.getItemCount!)
    turtle.select(1)

place_saplings = ->
    print "Placing a sapling..."
    turtle.select(16)
    turtle.placeDown!
    turtle.select(16)

dump_wood = ->
    print "Dumping wood..."
    for i=1,15
        turtle.select i
        turtle.dropDown!
    turtle.select(1)

harvest = ->
    print "Harvesting!"
    turtle.dig!
    turtle.forward!
    turtle.digDown!
    print "Planting sapling..."
    place_saplings!
    success, data = turtle.inspectUp()
    --unless data.name == "minecraft:leaves"
    --    turtle.digUp!
    --    turtle.up!
    --    success, data = turtle.inspectUp()
    going_up = true
    print "Going up..."
    while going_up
        if turtle.detectUp!
            turtle.digUp!
            turtle.up!
        else 
            going_up = false
    going_down = true
    print "Going down..."
    while going_down
        if not turtle.detectDown!
            turtle.down!
        else 
            going_down = false
    --success, data = turtle.inspectUp()
    --unless data.name == "minecraft:sapling"
    --    turtle.down!
    --    success, data = turtle.inspectUp()

search = ->
    success, data = turtle.inspect()

    --Detect CHEST
    if data.name == "minecraft:chest"
        dump_wood!
        check_fuel!
        get_saplings!
        turtle.turnLeft!
        turtle.turnLeft!

    unless turtle.detect!
        turtle.forward!
    
    --Detect DIORITE and turn RIGHT
    if (data.name == "minecraft:stone") and (data.metadata == 3)
        turtle.turnRight!

    --Detect ANDESITE and turn LEFT
    if (data.name == "minecraft:stone") and (data.metadata == 5)
        turtle.turnLeft!

    --Detect GRANITE and turn AROUND
    if (data.name == "minecraft:stone") and (data.metadata == 1)
        turtle.turnLeft!
        turtle.turnLeft!

    if data.name == "minecraft:leaves"
        turtle.dig!

    --success, data = turtle.inspect()
    if data.name == "minecraft:log"
        print "Found tree!"
        harvest!
        
	
running = true

while running
    search!
