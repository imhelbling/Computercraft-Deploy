running = true
print "Running..."

get_material = ->
  if turtle.getItemCount! == 0
    print "Slot empty, switching..."
    if turtle.getSelectedSlot! == 16
      turtle.select 1
    else
      turtle.select turtle.getSelectedSlot! + 1

turn_around = ->
  turtle.turnLeft!
  turtle.turnLeft!

something_is_overhead = ->
  turtle.detectUp!

end_of_row = ->
  turtle.detect! and not turtle.detectUp!

if turtle.detect!
  print "Wrong direction, turning around..."
  turn_around!

print "Here we go!"
while running
  get_material!

  if something_is_overhead!
    turtle.placeDown!
    print "All done!"
    running = false

  elseif end_of_row!
    turtle.placeDown!
    print "Starting new row..."
    turtle.up!
    turn_around!

  else
    print "Laying block..."
    turtle.placeDown!
    turtle.forward!
