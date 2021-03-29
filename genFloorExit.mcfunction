# if a checkConnection stand has crossed the posX boundary, generate the exit room

# kill floorExit stands if we've already got an exit
execute @e[type=minecraft:armor_stand, name=floorExit, tag=generated] ~ ~ ~ kill @e[type=minecraft:armor_stand, name=floorExit, tag=!generated]
# TODO: kill the old room's exit markers?
execute @r[type=minecraft:armor_stand, name=exitRoom] ~ ~ ~ structure save exitRoom ~1 ~-3 ~-15 ~16 ~12 ~
execute @e[type=minecraft:armor_stand, name=floorExit, tag=!generated] ~ ~ ~ structure load exitRoom ~-7 ~-1 ~-7
tag @e[type=minecraft:armor_stand, name=floorExit] add generated

# if not, call genRoom, which calls genExits, which calls this again.
# actually, call genRoom as long as there's a roomCenter?
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ function genRoom