slot_check = ->
    if turtle.getItemCount! == 0
        print "Slot empty, switching..."
        if turtle.getSelectedSlot! == 16
            turtle.select 1 
        else
            turtle.select(turtle.getSelectedSlot! + 1)

running = true
hover = false
print "Running..."



print "Building bridge now!"

turtle.forward!
slot_check!
print "Laying block..."
turtle.placeDown!
turtle.forward!

while running
    unless turtle.detectDown!
        slot_check!
        print "Laying block..."
        turtle.placeDown!
        turtle.forward!
    if turtle.detectDown!
        export running = false


print "All done!"
turtle.forward!