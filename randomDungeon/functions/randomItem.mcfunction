# randomize which dropper to load for item stands
# for item1, item2 etc. this step is skipped and
# the score is set from randomItems
execute @e[name=itemStorage, type=armor_stand, tag=random] ~~~ scoreboard players random @e[name=itemStorage, type=minecraft:armor_stand] random 0 4

execute @e[name=itemStorage, type=armor_stand, scores={random=0}] ~~~ structure save itemDropper ~ ~-1 ~ ~ ~-1 ~
execute @e[name=itemStorage, type=armor_stand, scores={random=1}] ~~~ structure save itemDropper ~1 ~-1 ~ ~1 ~-1 ~
execute @e[name=itemStorage, type=armor_stand, scores={random=2}] ~~~ structure save itemDropper ~2 ~-1 ~ ~2 ~-1 ~
execute @e[name=itemStorage, type=armor_stand, scores={random=3}] ~~~ structure save itemDropper ~3 ~-1 ~ ~3 ~-1 ~
execute @e[name=itemStorage, type=armor_stand, scores={random=4}] ~~~ structure save itemDropper ~4 ~-1 ~ ~4 ~-1 ~

tag @r[tag=spawning, type=armor_stand] add nextItem
execute @e[tag=nextItem, type=armor_stand] ~~~ structure load itemDropper ~ ~1 ~
execute @e[tag=nextItem, type=armor_stand] ~~~ setblock ~ ~2 ~ redstone_block
tag @e[tag=nextItem, type=armor_stand] remove spawning
# used for cleaning up the dispensers and stands
tag @e[tag=nextItem, type=armor_stand] add itemSpawned
tag @e[tag=nextItem, type=armor_stand] remove nextItem