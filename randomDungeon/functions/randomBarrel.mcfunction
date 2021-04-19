execute @e[name=randomBarrels, type=armor_stand] ~~~ spreadplayers ~ ~ 0 1 @e[name=barrelMarker]
execute @e[name=barrelMarker, type=armor_stand] ~~~ structure save barrel ~ ~-2 ~ ~ ~-2 ~
tag @r[name=barrel, type=armor_stand] add nextBarrel
execute @e[tag=nextBarrel, type=armor_stand] ~~~ structure load barrel ~ ~ ~
kill @e[tag=nextBarrel, type=armor_stand]