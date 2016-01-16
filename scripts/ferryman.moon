fill_inv = ->
    for i=1,16
        turtle.select i
        turtle.suck!

dump_inv = ->
    for i=1,16
        turtle.select i
        turtle.dropDown!

running = true
print "Good day to you! I'm ready to ferry your goods between two stations."
while running
    if turtle.detect!
        print "Dumping inventory..."
        dump_inv!
        if turtle.getFuelLevel! < 1000
            print "Fuel low, refueling..."
            turtle.suckUp!
            turtle.refuel!
        io.write "Refueled. Fuel level: "
        print turtle.getFuelLevel!
        print "Filling inventory..."
        fill_inv!
        turtle.turnLeft!
        turtle.turnLeft!
    print "And I'm off!"
    while not turtle.detect!
        turtle.forward!
