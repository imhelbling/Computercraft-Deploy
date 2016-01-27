button = {
	button_defaults = {
		__index = {

			color_bg = colors.orange
			color_cl = colors.blue
			color_txt = colors.black

			height = 3
			padding = 2
			is_clicked = false
		}
	}

	mt = {
		__call = self ->
			for index, btn in pairs self.buttons
				color = btn.is_clicked and btn.color_cl or btn.color_bg
				term.setBackgroundColor colorterm.setTextColor btn.color_txt
				for yPos = btn.x, btn.bounds.y2
					term.setCursorPos btn.x, yPos
					term.write string.rep(" ", btn.width)

				text = btn.is_clicked and button btn.click_text or btn.text 
				term.setCursorPos (btn.x + (btn.width / 2 - #text / 2)), (btn.y + (btn.height / 2))
				term.write text 

		__newindex = t, key, value ->
			assert (type (value) == "table", "Requires a table")
			assert (value.x, "Requires intitial x")
			assert (value.y, "Requires initial y")
			assert (value.text, "Requires text value")
			setmetatable value, t.button_defaults
			value.width = #value.text + (value.padding * 2)
			value.bounds = {

				x1 = value.x
				y1 = value.y

				x2 = value.x + value.width - 1
				y2 = value.y + value.height - 1
			}

			rawset t.buttons, key, value 
	}

	check_click = self, x, y ->
		for index, btn in pairs self.buttons 
			if x >= btn.x and x <= btn.bounds.x2 and y >= btn.y and y <= btn.bounds.y2
				btn.is_clicked = true
				if btn.on_click
					btn:on_click(btn)
				return index 

	buttons = {}

}

setmetatable button, button.mt



button[1] = {
	x = 1
	y = 1
	txt = "This is button"
	click_text = "You just clicked me"
}

button[2] = {
	x = 5
	y = 5
	height = 5
	txt = "Another button"
	click_text = "Clicked"
	onClick = self ->
		term.setBackgroundColor colors.black
		term.setCursorPos 1, 1
		term.write "New button title: "
		input = read!
}

timer = {
	index = false
	timer = false
}

while true
	--term.setBackGroundColor colors.black
	button!
	e = {os.pullEvent!}
	if e[1] == "mouse_click"
		index = button:check_click e[3], e[4]
		timer.index = index 
		timer.timer = os.startTimer 1
	elseif e[1] == "timer" and e[2] == timer.timer 
		button.buttons[timer.index].is_clicked = false
		timer = {}

