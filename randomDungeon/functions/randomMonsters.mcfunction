# five monster classes are hardcoded here
# the dispenser for the first is under the monsterStorage stand
# the next dispenser is one block in the positive x direction from the first
# and so on

tag @e[name=monster1, tag=inDungeon, type=armor_stand] add spawning
execute @e[name=monsterStorage, tag=chosenFloor, type=armor_stand] ~~~ structure save monsterDispenser ~ ~-1 ~ ~ ~-1 ~
execute @e[name=monster1, type=minecraft:armor_stand] ~~~ function randomMonster

tag @e[name=monster2, tag=inDungeon, type=armor_stand] add spawning
execute @e[name=monsterStorage, tag=chosenFloor, type=armor_stand] ~~~ structure save monsterDispenser ~1 ~-1 ~ ~1 ~-1 ~
execute @e[name=monster2, type=minecraft:armor_stand] ~~~ function randomMonster

tag @e[name=monster3, tag=inDungeon, type=armor_stand] add spawning
execute @e[name=monsterStorage, tag=chosenFloor, type=armor_stand] ~~~ structure save monsterDispenser ~2 ~-1 ~ ~2 ~-1 ~
execute @e[name=monster3, type=minecraft:armor_stand] ~~~ function randomMonster

tag @e[name=monster4, tag=inDungeon, type=armor_stand] add spawning
execute @e[name=monsterStorage, tag=chosenFloor, type=armor_stand] ~~~ structure save monsterDispenser ~3 ~-1 ~ ~3 ~-1 ~
execute @e[name=monster4, type=minecraft:armor_stand] ~~~ function randomMonster

tag @e[name=monster5, tag=inDungeon, type=armor_stand] add spawning
execute @e[name=monsterStorage, tag=chosenFloor, type=armor_stand] ~~~ structure save monsterDispenser ~4 ~-1 ~ ~4 ~-1 ~
execute @e[name=monster5, type=minecraft:armor_stand] ~~~ function randomMonster

# trigger cleanup
execute @e[name=monsterStorage, tag=chosenFloor, type=armor_stand] ~~~ setblock ~2 ~1 ~ redstone_block