tArgs = { ... }
if #tArgs < 1
	print "Usage: go <direction> <distance>"
	return


tHandlers = {
	"fd" = turtle.forward
	"forward" = turtle.forward
	"forwards" = turtle.forward
	"bk" = turtle.back
	"back" = turtle.back
	"up" = turtle.up
	"dn" = turtle.down
	"down" = turtle.down
	"lt" = turtle.turnLeft
	"left" = turtle.turnLeft
	"rt" = turtle.turnRight
	"right" = turtle.turnRight
}

nArg = 1
while nArg <= #tArgs
	sDirection = tArgs[nArg]
	nDistance = 1
	if nArg < #tArgs
		num = tonumber tArgs[nArg + 1]
		if num
			nDistance = num
			nArg +=1
		
	
	nArg += 1

	fnHandler = tHandlers[string.lower(sDirection)]
	if fnHandler
		while nDistance > 0
			if fnHandler!
				nDistance -= 1
			elseif turtle.getFuelLevel! == 0
				print "Out of fuel"
				return
			else
				sleep 0.5
			
		
	else
		print "No such direction: "..sDirection
		print "Try: forward, back, up, down"
		return
	

