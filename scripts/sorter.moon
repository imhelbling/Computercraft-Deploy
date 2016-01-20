check_fuel = ->
    print "Checking fuel..."
	if turtle.getFuelLevel! < 500
        print "Fuel low, refueling..."
        turtle.suckUp!
        turtle.refuel!
    print("Fuel level: ", turtle.getFuelLevel!)

granite = ->
    success, data = turtle.inspectDown()
    if (data.name == "minecraft:stone") and (data.metadata == 1)
        return true

diorite = ->
    success, data = turtle.inspectDown()
    if (data.name == "minecraft:stone") and (data.metadata == 3)
        return true