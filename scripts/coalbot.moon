check_fuel = ->
    print "Checking fuel..."
	if turtle.getFuelLevel! < 500
        print "Fuel low, refueling..."
        turtle.suck!
        turtle.refuel!
    print("Fuel level: ", turtle.getFuelLevel!)



running = true

while running
	turtle.select(1)
	turtle.suckDown!
	turtle.select(2)
	turtle.suckDown!
	turtle.select(3)
	turtle.suckDown!
	
	turtle.back!
	turtle.select(1)
	turtle.dropDown!

	turtle.back!
	turtle.select(2)
	turtle.dropDown!
	turtle.select(1)

	turtle.turnRight!
	turtle.back!
	turtle.down!
	turtle.down!

	turtle.suck!

	turtle.up!
	turtle.drop(turtle.getItemCount! * (8/64))

	turtle.turnLeft!
	turtle.forward!
	turtle.turnRight!
	turtle.down!

	turtle.suck!

	turtle.up!
	turtle.drop(turtle.getItemCount! * (8/56))

	turtle.up!
	turtle.up!
	turtle.forward!
	turtle.turnLeft!
	turtle.forward!

	turtle.drop(turtle.getItemCount! * (24/48))
	check_fuel!

	turtle.turnRight!
	turtle.forward!
	turtle.forward!
	turtle.turnLeft!

	turtle.drop(turtle.getItemCount! * (12/24))

	turtle.turnLeft!
	turtle.turnLeft!

	turtle.drop!

	turtle.turnRight!
	turtle.forward!
	turtle.forward!
	turtle.turnRight!