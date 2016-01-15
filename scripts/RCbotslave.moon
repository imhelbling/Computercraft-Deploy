listen = ->
  senderId, message, protocol = rednet.receive!

running = true

rednet.open "left"

while running
  listen!
  while message == "forward"
    turtle.forward!
    listen!
    if message = "stop"
      return

    while message == "back"
      turtle.back!
      listen!
      if message == "stop"
        return

    while message == "left"
      turtle.turnLeft!
      listen!
      if message == "stop"
        return

    while message == "right"
      turtle.turnRight!
      listen!
      if message == "stop"
        return
