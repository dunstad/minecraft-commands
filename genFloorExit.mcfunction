# if a checkConnection stand has crossed the posX boundary, generate the exit room

# kill floorExit stands if we've already got an exit
execute @e[type=minecraft:armor_stand, name=floorExit, tag=generated] ~ ~ ~ kill @e[type=minecraft:armor_stand, name=floorExit, tag=!generated]
# TODO: kill the old room's exit markers?
# TODO: save structure only when floor exit stand exists
execute @r[type=minecraft:armor_stand, name=exitRoom] ~ ~ ~ structure save exitRoom ~1 ~-3 ~-15 ~16 ~12 ~
execute @e[type=minecraft:armor_stand, name=floorExit, tag=!generated] ~ ~ ~ structure load exitRoom ~-7 ~-1 ~-7
tag @e[type=minecraft:armor_stand, name=floorExit] add generated

# keep generating paths until they all end
# execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ function genRoom