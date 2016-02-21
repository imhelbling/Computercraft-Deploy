


class Button
	new: (@text, x, y, width, height) =>
		@corner_a = {
			x: x
			y: y 
		}

		@corner_b = { 
			x: x + string.len @text
			y: y + height 
		}



		@text_pos = {
			x: @corner_1.x + 1
			y: (@corner_4.y - @corner_1.y) / 2
		}

	render: =>

		for i1=@corner_1.y, @corner_4.y










button1 = Button "foo", 2, 5, 10, 5

button2 = Button "bar", 15, 5, 10, 5

print ""

print "hello world"

print ""

print button1.text
print button1.corner_1.x, button1.corner_1.y
print button1.corner_2.x, button1.corner_2.y
print button1.corner_3.x, button1.corner_3.y
print button1.corner_4.x, button1.corner_4.y

print ""

print button2.text
print button2.corner_1.x, button2.corner_1.y
print button2.corner_2.x, button2.corner_2.y
print button2.corner_3.x, button2.corner_3.y
print button2.corner_4.x, button2.corner_4.y

print ""