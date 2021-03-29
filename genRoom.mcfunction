# at the starting armor stand, we load a random room from a set of entrance rooms
# make new rooms using the frames, the position works well with them and is inconvenient otherwise
# TODO: load only from rooms in line with a floor selection stand
execute @r[type=minecraft:armor_stand, name=randomRoom] ~ ~ ~ structure save randomRoom ~1 ~-3 ~-15 ~16 ~12 ~

# randomize rotation
execute @e[type=minecraft:armor_stand, name=roomCenter] ~-2 ~ ~-2 summon minecraft:armor_stand 0_degrees
execute @e[type=minecraft:armor_stand, name=roomCenter] ~-2 ~ ~-2 summon minecraft:armor_stand 90_degrees
execute @e[type=minecraft:armor_stand, name=roomCenter] ~-2 ~ ~-2 summon minecraft:armor_stand 180_degrees
execute @e[type=minecraft:armor_stand, name=roomCenter] ~-2 ~ ~-2 summon minecraft:armor_stand 270_Degrees

execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ tag @r[type=minecraft:armor_stand, x=~-2, dx=1, y=~, dy=1, z=~-2, dz=1, c=1] add rotation
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ kill @e[type=minecraft:armor_stand, x=~-2, dx=1, y=~, dy=1, z=~-2, dz=1, tag=!rotation]

# spawn the rotated room
# only one of these should run
execute @r[type=minecraft:armor_stand, name=0_degrees] ~2 ~ ~2 structure load randomRoom ~-7 ~-1 ~-7 0_degrees
execute @r[type=minecraft:armor_stand, name=90_degrees] ~2 ~ ~2 structure load randomRoom ~-7 ~-1 ~-7 90_degrees
execute @r[type=minecraft:armor_stand, name=180_degrees] ~2 ~ ~2 structure load randomRoom ~-7 ~-1 ~-7 180_degrees
execute @r[type=minecraft:armor_stand, name=270_degrees] ~2 ~ ~2 structure load randomRoom ~-7 ~-1 ~-7 270_degrees
kill @e[tag=rotation]

function genExits