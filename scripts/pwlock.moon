term.clear!
term.setCursorPos 1, 1
os.setComputerLabel "cargo_bay_term"
os.pullEvent = os.pullEventRaw

redstone.setOutput("right", true)
turtle_locked = true

toggle_lights = ->
	if redstone.getOutput("back")
		redstone.setOutput("back", false)
	else 
		redstone.setOutput("back", true)

check_pass = ->
	io.write "ENTER PASSCODE: "
	pass = read("*")
	if pass == "12345"
		return true

unlock = ->
	if check_pass!
		print "ACCESS GRANTED, GATE UNLOCKED"
		redstone.setOutput("right", false)
		turtle_locked = false
	else 
		print "ACCESS DENIED"


lock = ->
	print "LOCKING GATE"
	redstone.setOutput("right", true)
	turtle_locked = true



running = true
lights_on = false

print "CARGO BAY TERMINAL"
while running
	io.write "> "
	input = io.read!
	
	if input == "unlock"
		unlock!
	elseif input == "lock"
		lock!
	elseif input == "lights"
		toggle_lights!
	elseif input == "exit"
		if check_pass!
			print "EXITING"
			running = false
		else 
			print "ACCESS DENIED"
	else
		print "INVALID"