# loop
function genRoom
function genExits
function genFloorExit

# keep generating paths until they all end
# there should only be one roomCenter at a time
execute @e[type=minecraft:armor_stand, name=roomCenter, c=1] ~ ~ ~ function genLoop

# will this only run after everything else is done?
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ kill @e[type=minecraft:armor_stand, tag=!decoration, x=~1, y=~, z=~1, dx=63, dy=15, dz=63]
kill @e[type=minecraft:armor_stand, name=negXZBorder, c=1]
kill @e[type=minecraft:armor_stand, name=posXZBorder, c=1]