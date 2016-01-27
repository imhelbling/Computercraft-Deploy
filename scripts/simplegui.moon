menu_options = { --This is our menu table. It contains basic data about the menu
    [1] = {text="Menu Option 1", color=colors.blue},
    [2] = {text="Menu Option 2", color=colors.orange},
    [3] = {text="Menu Option 3", color=colors.cyan}
}

termX, termY = term.getSize! --The x/y size of the terminal

menuDraw = selected -> --Our main draw function

    yPos = termY/2 - #menu_options/2 --The initial y position

    for index, data in pairs menu_options 

        menu_options[index].bounds = { --Create a new table in each option with the boundary data
            x1 = termX/2 - (#data.text+4)/2;
            x2 = termX/2 + (#data.text+4)/2;
            y = yPos;
        }

        term.setTextColor data.color
        term.setCursorPos (data.bounds.x1, data.bounds.y)
        
        text =
            index==selected and "[ "..data.text.." ]" or
            "  "..data.text.."  " --Essentially an if statement, but in a contracted form
        term.write(text)
        yPos = yPos+1 --Increment the initial y pos so we can move on the next line
  

 
checkClick = x, y -> --Check the mouse click to see if there's a menu option

    for index, data in pairs menu_options 

        if x>= data.bounds.x1 and x<= data.bounds.x2 and y==data.bounds.y

            return index --Returns the index of the clicked option
      
    
    return false --If it went through the entire for loop without success, return false


 
term.setBackgroundColor colors.white 
term.clear!
 


selector = 1 --Our selector



while true  --The main loop. I would generally put this inside of a function for a program.

    menuDraw selector --Draw the menu first

    e = {os.pullEvent!} --Pull an event and put the returned values into a table

    if e[1] == "key" --If it's a key...

        if e[2] == keys.down -- ... and it's the down arrow
            selector = selector < #menu_options and selector+1 or 1 --Increment the selector if the selector < #menu_options. Otherwise reset it to 1

        elseif e[2] == keys.up
            selector = selector > 1 and selector-1 or #menu_options --Decrement the selector if the selector > 1. Otherwise, reset it to #menu_options

        elseif e[2] == keys.enter
            break --Break out of the loop
        
    elseif e[1] == "mouse_click"

        value = checkClick(e[3], e[4]) --Check the mouse click

        if value --If checkClick returns a value and not false
            selector = value --Set the selector to that value and break out of the loop
            break 
    

 
term.clear!
term.setCursorPos(1,1)
term.write("Selected: "..selector)