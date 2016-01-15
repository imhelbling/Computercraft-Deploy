running = true
print "Running..."
 
if turtle.detect() then
	print "Wrong direction, turning around..."
    turtle.turnLeft()
    turtle.turnLeft()
end

print "Here we go!" 

while running do
    if turtle.detectUp() == true then
		if turtle.getItemCount() == 0 then
			print "Slot empty, switching..."
       		if turtle.getSelectedSlot() == 16 then
       			turtle.select(1)
       		else
       	    	turtle.select(turtle.getSelectedSlot() + 1)
       	    end
		end
		turtle.placeDown()
		print "All done!"
        running = false
	end
    if turtle.detect() and (turtle.detectUp() == false) then
		if turtle.getItemCount() == 0 then
			print "Slot empty, switching..."
       		if turtle.getSelectedSlot() == 16 then
       			turtle.select(1)
       		else
       	    	turtle.select(turtle.getSelectedSlot() + 1)
       	    end
		end
		turtle.placeDown()
		print "Starting new row..."
        turtle.up()
        turtle.turnLeft()
        turtle.turnLeft()
	end
    if (turtle.detect() == false) and (turtle.detectUp() == false) then
    	if turtle.getItemCount() == 0 then
			print "Slot empty, switching..."
       		if turtle.getSelectedSlot() == 16 then
       			turtle.select(1)
       		else
       	    	turtle.select(turtle.getSelectedSlot() + 1)
       	    end
		end
		print "Laying block..."
       	turtle.placeDown()
       	turtle.forward()
    end
end