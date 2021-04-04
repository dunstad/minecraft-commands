summon minecraft:armor_stand makeDungeon ~1 ~ ~

execute @e[type=minecraft:armor_stand, name=makeDungeon] ~ ~ ~ fill ~ ~ ~-31 ~63 ~15 ~32 air
execute @e[type=minecraft:armor_stand, name=makeDungeon] ~ ~ ~ fill ~ ~-1 ~-31 ~63 ~-1 ~32 planks

# so we have two armor stands to denote the corners of the dungeon grid
# which will have space for 4 rooms by 4 rooms
# these stands are one block outside the area dungeon rooms will spawn in
execute @e[type=minecraft:armor_stand, name=makeDungeon] ~-1 ~ ~-32 summon minecraft:armor_stand negXZBorder
execute @e[type=minecraft:armor_stand, name=makeDungeon] ~65 ~ ~33 summon minecraft:armor_stand posXZBorder