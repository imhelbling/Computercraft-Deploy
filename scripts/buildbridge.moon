slot_check = ->
  if turtle.getItemCount() == 0
    print "Slot empty, switching..."
    if turtle.getSelectedSlot! == 16
      turtle.select(1)
    else
      turtle.select turtle.getSelectedSlot! + 1

running = true
hover = false

while running do
  slot_check!
  if turtle.detect
    print "Laying block..."
    turtle.placeDown!
    turtle.forward!
