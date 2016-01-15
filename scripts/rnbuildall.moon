running = true

print "Running..."

if turtle.detect!
  print "Wrong direction, turning around..."
  turtle.turnLeft!
  turtle.turnLeft!

print "Here we go!"

while running
  if turtle.detectUp!
    if turtle.getItemCount! == 0
      print "Slot empty, switching..."
      if turtle.getSelectedSlot! == 16
        turtle.select 1
      else
        turtle.select turtle.getSelectedSlot! + 1
    turtle.placeDown!
    print "ALL done!"
    running = false

  if turtle.detect! and not turtle.detectUp!
    if turtle.getItemCount! == 0
      print "Slot empty, switching..."
      if turtle.getSelectedSlot! == 16
        turtle.select(1)
      else
        turtle.select turtle.getSelectedSlot! + 1
    turtle.placeDown!
    print "Starting new row..."
    turtle.up!
    turtle.turnLeft!
    turtle.turnLeft!

  if not turtle.detect! and not turtle.detectUp!
    if turtle.getItemCount! == 0
      print "Slot empty, switching..."
      if turtle.getSelectedSlot! == 16
        turtle.select 1
      else
        turtle.select turtle.getSelectedSlot! + 1
    print "Laying block..."
    turtle.placeDown!
    turtle.forward!
