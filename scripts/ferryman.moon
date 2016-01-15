fill_inv = ->
  for i=1,16
    turtle.select i
    turtle.suck!

dump_inv = ->
  for i=1,16
    turtle.select i
    turtle.dropDown!

running = true

while running
  if turtle.detect!
    dump_inv!
    fill_inv!
    turtle.turnLeft!
    turtle.turnLeft!
  while not turtle.detect!
    turtle.forward()
