transfer_money = (giver, reciever, ammount) ->
	giver -= ammount
	reciever += ammount

users = {
	isu: {
		name: "Isu"
		rank: "Rookie"
		balance: 1000
		wins: 3
		losses: 2
		inv: {
			"Isu's ID Card"
			"bow"
			"chain helmet"
		}
	}
	yelimsxela: {
		name: "yelimsxela"
		rank: "Rookie"
		balance: 1500
		wins: 4
		losses: 3
		inv: {
			"yelimsxela's ID Card"
			"iron sword"
			"leather armor"
			"tnt"
		}
	}
}

contraband = {
	"iron sword"
	"tnt"
	"monster spawner"
}

users.isu.balance += 2000

print users.isu.balance
print users.yelimsxela.balance

transfer_money users.yelimsxela.balance, users.isu.balance, 500

print users.isu.balance
print users.yelimsxela.balance








--table.insert users.yelimsxela.inv, "potion"

--print ""
--for i1=1,#users.yelimsxela.inv
--	for i2=1,#contraband
--		if users.yelimsxela.inv[i1] == contraband[i2]
--			print "Removed "..users.yelimsxela.inv[i1]
--			table.remove users.yelimsxela.inv, i1
--
--
--
--print ""
--for i,_ in pairs users
--	if tostring(i) == "yelimsxela"
--		print (i.."'s inventory:")
--		print ""
--		for i,v in pairs users[i].inv
--			print i,v
--
--print ""--

