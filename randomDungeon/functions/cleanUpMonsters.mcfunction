# this function should be run from a command block with a delay of 6
# the plan is to load a structure containing it when we call randomMonster
# we do it this way to give the dispensers time to spit monsters out
execute @e[tag=monsterSpawned, type=armor_stand] ~~~ fill ~ ~1 ~ ~ ~2 ~ air
# currently tall monsters spawn a bit in the floor, this should fix it
execute @e[tag=monsterSpawned, type=armor_stand] ~~~ tag @e[c=1, type=!minecraft:armor_stand, tag=!teleport] add teleport
execute @e[tag=teleport] ~~~ tp @s ~ ~1 ~
tag @e[tag=teleport] remove teleport
kill @e[tag=monsterSpawned, type=armor_stand]