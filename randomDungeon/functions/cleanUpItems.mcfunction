# this function should be run from a command block with a delay of 6
# the plan is to load a structure containing it when we call randomItem
# we do it this way to give the dispensers time to spit items out
execute @e[tag=itemSpawned, type=armor_stand] ~~~ fill ~ ~1 ~ ~ ~2 ~ air
kill @e[tag=itemSpawned, type=armor_stand]