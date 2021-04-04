# randomly determine which of the 4 top rooms to spawn the starting armor stand in
# 16x16 rooms have 4 central blocks
# central armor stand spawns on the -x -z central block
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~8 ~ ~8 summon minecraft:armor_stand makeEntranceRoom
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~8 ~ ~24 summon minecraft:armor_stand makeEntranceRoom
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~8 ~ ~40 summon minecraft:armor_stand makeEntranceRoom
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~8 ~ ~56 summon minecraft:armor_stand makeEntranceRoom

# tag one entrance stand and remove the others
tag @r[type=minecraft:armor_stand, name=makeEntranceRoom, c=1] add entrance
kill @e[type=minecraft:armor_stand, name=makeEntranceRoom, tag=!entrance]
tag @e[tag=entrance] remove entrance

# at the starting armor stand, we load a random room from a set of entrance rooms
# make new rooms using the frames, the position works well with them and is inconvenient otherwise
execute @r[type=minecraft:armor_stand, name=entranceRoom, tag=chosenFloor] ~ ~ ~ structure save entranceRoom ~1 ~-3 ~-15 ~16 ~12 ~

# randomize rotation
# let's not do this for the entrance actually
execute @e[type=minecraft:armor_stand, name=makeEntranceRoom] ~-2 ~ ~-2 summon minecraft:armor_stand 0_degrees
# execute @e[type=minecraft:armor_stand, name=makeEntranceRoom] ~-2 ~ ~-2 summon minecraft:armor_stand 90_degrees
# execute @e[type=minecraft:armor_stand, name=makeEntranceRoom] ~-2 ~ ~-2 summon minecraft:armor_stand 180_degrees
# execute @e[type=minecraft:armor_stand, name=makeEntranceRoom] ~-2 ~ ~-2 summon minecraft:armor_stand 270_Degrees

execute @e[type=minecraft:armor_stand, name=makeEntranceRoom] ~ ~ ~ tag @r[type=minecraft:armor_stand, x=~-2, dx=1, y=~, dy=1, z=~-2, dz=1, c=1] add rotation
# execute @e[type=minecraft:armor_stand, name=makeEntranceRoom] ~ ~ ~ kill @e[type=minecraft:armor_stand, x=~-2, dx=1, y=~, dy=1, z=~-2, dz=1, tag=!rotation]

# spawn the rotated room
# only one of these should run
execute @r[type=minecraft:armor_stand, name=0_degrees] ~2 ~ ~2 structure load entranceRoom ~-7 ~-1 ~-7 0_degrees
# execute @r[type=minecraft:armor_stand, name=90_degrees] ~2 ~ ~2 structure load entranceRoom ~-7 ~-1 ~-7 90_degrees
# execute @r[type=minecraft:armor_stand, name=180_degrees] ~2 ~ ~2 structure load entranceRoom ~-7 ~-1 ~-7 180_degrees
# execute @r[type=minecraft:armor_stand, name=270_degrees] ~2 ~ ~2 structure load entranceRoom ~-7 ~-1 ~-7 270_degrees
kill @e[tag=rotation]

# rename the entrance room stand after generation
# this way we can use the same exit generation code as all other rooms
execute @e[type=minecraft:armor_stand, name=makeEntranceRoom] ~ ~ ~ summon minecraft:armor_stand roomCenter
# prevents the entrance from being regenerated for not connecting to other room exits
tag @e[type=minecraft:armor_stand, name=roomCenter] add noReroll
kill @e[type=minecraft:armor_stand, name=makeEntranceRoom]