# this lets us spawn an item from a random item class
scoreboard objectives add random dummy

tag @e[name=itemStorage, type=minecraft:armor_stand] add random
tag @e[name=item, type=minecraft:armor_stand] add spawning
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem
tag @e[tag=random, type=minecraft:armor_stand] remove random

tag @e[name=item1, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, type=minecraft:armor_stand] random 0
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

tag @e[name=item2, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, type=minecraft:armor_stand] random 1
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

tag @e[name=item3, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, type=minecraft:armor_stand] random 2
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

tag @e[name=item4, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, type=minecraft:armor_stand] random 3
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem

tag @e[name=item5, type=minecraft:armor_stand] add spawning
scoreboard players set @e[name=itemStorage, type=minecraft:armor_stand] random 4
execute @e[tag=spawning, type=minecraft:armor_stand] ~~~ function randomItem