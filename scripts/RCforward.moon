rednet.open bottom

running = true

while running
  -- forward
  if redstone.getInput "front"
    rednet.send 26, "forward"

  -- back
  if redstone.getInput "back"
    rednet.send 26, "back"

  -- left
  if redstone.getInput "left"
    rednet.send 26, "left"

  -- right
  if redstone.getInput "right"
    rednet.send 26, "right"
