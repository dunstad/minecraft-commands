# TODO: execute relative to negXZBorder
execute @e[type=minecraft:armor_stand, name=makeDungeon] ~ ~ ~ fill ~ ~ ~-31 ~63 ~15 ~32 air
execute @e[type=minecraft:armor_stand, name=makeDungeon] ~ ~ ~ fill ~ ~-1 ~-31 ~63 ~-1 ~32 planks
# execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ kill @e[type=minecraft:armor_stand, x=~1, y=~, z=~1, dx=63, dy=15, dz=63]
# kill @e[type=minecraft:armor_stand, name=negXZBorder, c=1]
# kill @e[type=minecraft:armor_stand, name=posXZBorder, c=1]