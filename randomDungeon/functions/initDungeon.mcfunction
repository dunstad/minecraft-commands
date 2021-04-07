
# so we have two armor stands to denote the corners of the dungeon grid
# which will have space for 4 rooms by 4 rooms
# these stands are one block outside the area dungeon rooms will spawn in
summon minecraft:armor_stand negXZBorder ~ ~ ~-32
summon minecraft:armor_stand posXZBorder ~64 ~ ~33

execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ fill ~1 ~ ~1 ~64 ~15 ~64 air

# replace the dungeon floor, and fill one level lower to support any gravity blocks
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ fill ~1 ~-1 ~1 ~64 ~-2 ~64 stone