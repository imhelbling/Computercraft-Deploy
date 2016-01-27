-- denoted by an IRON ORE BLOCK marker
minerals = {
    "minecraft:coal_block",
    "minecraft:coal",

    "minecraft:iron_ore",
    "minecraft:iron_block",
    "minecraft:iron_ingot",
}

-- denoted by a REDSTONE BLOCK marker
redstone = {
    "minecraft:iron_door",
    "minecraft:iron_trapdoor",

    ""
}

-- denoted by an BLOCK OF IRON marker
weapons_armor = {

}

-- denoted by a CRAFTING TABLE marker
gear_tools = {
    "minecraft:bucket",
    "minecraft:bed",
    "minecraft:boat",
    "minecraft:shears",
    "minecraft:crafting_table",
    "minecraft:chest",
    "minecraft:torch",
    "minecraft:ladder",
    "minecraft:sign",

    

}


-- denoted by a BOOK SHELF marker
decorations = {
    "minecraft:painting",
    "minecraft:item_frame",
    "minecraft:armor_stand",
    "minecraft:bookshelf",

    "minecraft:fence",
    "minecraft:spruce_fence",
    "minecraft:birch_fence",
    "minecraft:jungle_fence",
    "minecraft:dark_oak_fence",
    "minecraft:acacia_fence",

    "minecraft:fence_gate",
    "minecraft:spruce_fence_gate",
    "minecraft:birch_fence_gate",
    "minecraft:jungle_fence_gate",
    "minecraft:dark_oak_fence_gate",
    "minecraft:acacia_fence_gate",

    "minecraft:iron_bars",

    "minecraft:wooden_door",
    "minecraft:spruce_door",
    "minecraft:birch_door",
    "minecraft:jungle_door",
    "minecraft:acacia_door",
    "minecraft:dark_oak_door",

    "minecraft:trapdoor",

}

-- denoted by a LOG marker
wood_stuff = {
    "minecraft:planks",
    
    "minecraft:log",
    
    "minecraft:minecraft:oak_stairs",
    "minecraft:spruce_stairs",
    "minecraft:birch_stairs",
    "minecraft:jungle_stairs",
    "minecraft:acacia_stairs",
    "minecraft:dark_oak_stairs",

    "minecraft:wooden_slab",

    "minecraft:stick",
    "minecraft:bowl",
    
}

check_fuel = ->
    print "Checking fuel..."
	if turtle.getFuelLevel! < 500
        print "Fuel low, refueling..."
        turtle.suckUp!
        turtle.refuel!
    print("Fuel level: ", turtle.getFuelLevel!)

scan_inv = (item_group) ->
    print "Scanning inventory..."
    item = turtle.getItemDetail!
    for i=1,16
        turtle.select i
        if item.name == 
    turtle.select 1

turn_around = ->
    if clockwise
        clockwise = false
    else 
        clockwise = true

granite = ->
    success, block = turtle.inspectDown!
    if (block.name == "minecraft:stone") and (data.metadata == 2)
        return true

diorite = ->
    success, block = turtle.inspectDown!
    if (block.name == "minecraft:stone") and (data.metadata == 4)
        return true
