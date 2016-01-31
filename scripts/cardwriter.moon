default_rank = "Rookie"
default_balance = 1000



new_profile = (name, rank, balance) ->
	profile = fs.open("/disk/profile", "w")

	profile.writeLine('name = '..'"'..name..'"')
	profile.writeLine('rank = '..'"'..rank..'"')
	profile.writeLine('balance = '..balance)

	profile.close!



edit_profile = (aspect,new_value) ->
		
		profile = fs.open("/disk/profile", "w")
		profile.writeLine(aspect..' = '..'"'..new_value..'"')
		profile.close!

		print ("New "..aspect.." is ".."'"..new_value.."'.")






edit_name = (new_name) ->
	profile = fs.open("/disk/profile", "w")

	profile.writeLine('name = '..'"'..new_name..'"')

	profile.close!

edit_rank = (new_rank) ->
	profile = fs.open("/disk/profile", "w")

	profile.writeLine('rank = '..'"'..new_rank..'"')

	profile.close!

edit_balance = (new_balance) ->
	profile = fs.open("/disk/profile", "w")

	profile.writeLine('balance = '..new_balance)

	profile.close!



while input ~= "quit"
	print "'New' profile, 'edit' existing, or 'quit'"
	input = io.read!

	if input == "new"
		print "Enter name for new profile:"
		input = io.read!
		new_profile(input, default_rank, default_balance)

	if input == "edit"
		while input ~= "exit"
			print "What would you like to edit?  (name, rank, balance, exit)"
			aspect = io.read!

			if aspect == "name" or "rank" or "balance"
				print "Enter new "..aspect.." for profile: "
				new_value == io.read!
				edit_profile(aspect, new_value)
				aspect = ""
				new_value = ""
				return
			else 
				print "Invalid"