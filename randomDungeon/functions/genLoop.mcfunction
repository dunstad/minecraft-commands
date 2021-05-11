# loop
function genRoom
function genExits
function genFloorExit

# keep generating paths until they all end
# there should only be one roomCenter at a time
execute @e[type=minecraft:armor_stand, name=roomCenter, c=1] ~ ~ ~ function genLoop

# only runs after everything else is done

# used to ignore item, monster, barrel stands in room templates
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ tag @e[type=minecraft:armor_stand, x=~1, y=~, z=~1, dx=63, dy=15, dz=63] add inDungeon

function randomMonsters
function randomItems
execute @e[type=minecraft:armor_stand, name=barrel] ~~~ function randomBarrel

execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ kill @e[type=minecraft:armor_stand, name="", tag=!decoration, x=~1, y=~, z=~1, dx=63, dy=15, dz=63]
kill @e[type=minecraft:armor_stand, name=negXZBorder, c=1]
kill @e[type=minecraft:armor_stand, name=posXZBorder, c=1]
kill @e[type=minecraft:armor_stand, name=floorExit, c=1]