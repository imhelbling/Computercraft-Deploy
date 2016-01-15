rednet.open bottom

running = true

while running

  --forward
  if redstone.getInput "front"
    rednet.send 26, "forward"

  --back
  elseif redstone.getInput "back"
    rednet.send 26, "back"

  --left
  elseif redstone.getInput "right"
    rednet.send 26, "left"

  --right
  elseif redstone.getInput "left"
    rednet.send 26, "right"

  --stop
  else
    rednet.send 26, "stop"
