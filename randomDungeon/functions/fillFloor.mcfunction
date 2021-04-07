# fill every spot with a random room before path generation

# TODO: why does it sometimes miss one random spot?

# summon four in a row
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~8 ~ ~8 summon minecraft:armor_stand roomCenter
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~8 ~ ~24 summon minecraft:armor_stand roomCenter
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~8 ~ ~40 summon minecraft:armor_stand roomCenter
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~8 ~ ~56 summon minecraft:armor_stand roomCenter

# make them all face +x
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ tp @s ~ ~ ~ facing ~1 ~ ~
tag @e[type=minecraft:armor_stand, name=roomCenter] add fillStand

# summon more in their look direction
execute @e[tag=fillStand] ~ ~ ~ summon minecraft:armor_stand roomCenter ^ ^ ^16
execute @e[tag=fillStand] ~ ~ ~ summon minecraft:armor_stand roomCenter ^ ^ ^32
execute @e[tag=fillStand] ~ ~ ~ summon minecraft:armor_stand roomCenter ^ ^ ^48

# generate all 16 rooms
execute @e[type=minecraft:armor_stand, name=roomCenter, c=16] ~ ~ ~ function genRoom

# clean up the stands
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ kill @e[type=minecraft:armor_stand, tag=!decoration, x=~1, y=~, z=~1, dx=63, dy=15, dz=63]