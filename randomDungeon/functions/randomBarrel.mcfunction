execute @e[name=randomBarrels, tag=chosenFloor, type=armor_stand] ~~~ spreadplayers ~ ~ 0 1 @e[name=barrelMarker]
execute @e[name=barrelMarker, tag=chosenFloor, type=armor_stand] ~~~ structure save barrel ~ ~-2 ~ ~ ~-2 ~
tag @r[name=barrel, tag=inDungeon, type=armor_stand] add nextBarrel
execute @e[tag=nextBarrel, type=armor_stand] ~~~ structure load barrel ~ ~ ~
kill @e[tag=nextBarrel, type=armor_stand]