--280, 193, -225

--282, 200, -225
--292, 200, -217

running = true

while running 
	os.pullEvent("redstone")
	if redstone.getInput "back"
		commands.exec "fill ~2 ~7 ~0 ~12 ~7 ~8 redstone_block"
		print "lights on"
	else
		commands.exec "fill ~2 ~7 ~0 ~12 ~7 ~8 air"
		print "lights off"