# if a checkConnection stand has crossed the posX boundary
#  and we don't have an exit yet, generate the exit room
# kill floorExit stands if we've already got an exit
execute @e[type=minecraft:armor_stand, name=floorExit, tag=generated] ~ ~ ~ kill @e[type=minecraft:armor_stand, name=floorExit, tag=!generated]
execute @e[type=minecraft:armor_stand, name=floorExit, tag=!generated] ~ ~ ~ execute @r[type=minecraft:armor_stand, name=exitRoom, tag=chosenFloor] ~ ~ ~ structure save exitRoom ~1 ~-3 ~-15 ~16 ~12 ~
execute @e[type=minecraft:armor_stand, name=floorExit, tag=!generated] ~ ~ ~ structure load exitRoom ~-7 ~-1 ~-7
tag @e[type=minecraft:armor_stand, name=floorExit] add generated