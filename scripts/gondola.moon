-- INPUT MATCHER --
is_match = (input, commands) ->
    for command in string.gmatch(commands, "([^,]+)") do
        if input == command
            return true
    return false

-- INPUT PROMPT --
get_input = ->
    
    print "--What do you do?"
    io.write "> "
    input = io.read()



-- IS IT A TURTLE? --
if turtle.getFuelLevel! == nil
	export is_turtle = false
else 
	export is_turtle = true



-- MAIN LOOP --
while input ~= "exit" do

	--Turtle Loop
	if is_turtle
		rednet.open("left")
		print ">> GND TURTLE <<"

	--Console Loop
	else
		rednet.open("top")
		io.write "GND TURTLE > "
		input = io.read!
		if is_match(input, "refuel")
			print "Refueling turtles..."



rednet.close("top")