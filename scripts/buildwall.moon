slot_switch = ->
    if turtle.getSelectedSlot! == 16
            turtle.select 1
        else
            turtle.select(turtle.getSelectedSlot! + 1)

slot_check = ->
    if turtle.getItemCount! == 0
        print "Slot empty, switching..."
    while turtle.getItemCount! == 0
            slot_switch!

lay_blocks = ->
    if turtle.detect!
        slot_check!
        turtle.placeDown!
        turtle.up!
        turtle.turnLeft!
        turtle.turnLeft!
    else
        slot_check!
        turtle.placeDown!
        turtle.forward!
    


running = true
print "Running..."
 


if turtle.detect!
	print "Wrong direction, turning around..."
    turtle.turnLeft!
    turtle.turnLeft!



print "Building wall now!" 

while running
    if turtle.detectUp!
		slot_check!
		turtle.placeDown!
        last_row = true
        while last_row
            lay_blocks!
            if turtle.detectUp!
                turtle.placeDown!
                last_row = false
                running = false
    else
        lay_blocks!



print "All done!"