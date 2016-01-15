rednet.open(bottom)

running = true

while running do

	--forward
	if redstone.getInput("front") then
		rednet.send(26, "forward")

	--back
	elseif redstone.getInput("back") then
		rednet.send(26, "back")

	--left
	elseif redstone.getInput("right") then
		rednet.send(26, "left")

	--right
	elseif redstone.getInput("left") then
		rednet.send(26, "right")

	--stop
	else
		rednet.send(26, "stop")
		
	end
end