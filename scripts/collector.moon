check_fuel = ->
    print "Checking fuel..."
	if turtle.getFuelLevel! < 500
        print "Fuel low, refueling..."
        turtle.suckUp!
        turtle.refuel!
    print("Fuel level: ", turtle.getFuelLevel!)

dump = ->
    print "Dumping saplings..."
    for i=1,16
        turtle.select i
        turtle.drop!

diorite = ->
    success, data = turtle.inspectDown()
    if (data.name == "minecraft:stone") and (data.metadata == 3)
        return true

andesite = ->
    success, data = turtle.inspectDown()
    if (data.name == "minecraft:stone") and (data.metadata == 5)
        return true

granite = ->
    success, data = turtle.inspectDown()
    if (data.name == "minecraft:stone") and (data.metadata == 1)
        return true


-- (MAIN FUNCTION)
search = ->
    --success, data = turtle.inspectDown()

    unless diorite! or andesite! or granite!
        turtle.suck!
        turtle.forward!
    
    --Detect DIORITE and turn RIGHT
    if diorite!
        turtle.turnRight!
        turtle.forward!

    --Detect ANDESITE and turn LEFT
    if andesite!
        turtle.turnLeft!
        turtle.forward!

    --Detect GRANITE and perform station actions
    if granite!
        turtle.turnRight!
        turtle.up!
        turtle.up!
        dump!
        check_fuel!
        turtle.down!
        turtle.down!
        turtle.forward!


	
running = true

while running
    search!