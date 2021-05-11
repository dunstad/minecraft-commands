# this lets us spawn an item from a random item class
scoreboard objectives add random dummy

tag @e[name=itemStorage, tag=chosenFloor, type=minecraft:armor_stand] add random
tag @e[name=item, tag=inDungeon, type=minecraft:armor_stand] add spawning
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem
tag @e[tag=random, type=minecraft:armor_stand] remove random

tag @e[name=item1, tag=inDungeon, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, tag=chosenFloor, type=minecraft:armor_stand] random 0
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

tag @e[name=item2, tag=inDungeon, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, tag=chosenFloor, type=minecraft:armor_stand] random 1
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

tag @e[name=item3, tag=inDungeon, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, tag=chosenFloor, type=minecraft:armor_stand] random 2
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

tag @e[name=item4, tag=inDungeon, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, tag=chosenFloor, type=minecraft:armor_stand] random 3
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

tag @e[name=item5, tag=inDungeon, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, tag=chosenFloor, type=minecraft:armor_stand] random 4
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

# trigger cleanup
execute @e[name=itemStorage, tag=chosenFloor, type=armor_stand] ~~~ setblock ~2 ~1 ~ redstone_block