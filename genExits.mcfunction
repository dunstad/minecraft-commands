# exits must be marked in the room structures via armor stands placed around the center
#       xx     o = room center
#       xx     x = valid location for a stand marking a room exit
#     xx  xx
#     xxo xx
#       xx
#       xx
# only one of the four valid spots in each direction needs to have a stand
# stands for new rooms are summoned at the centers of adjacent rooms
# (pretty sure that number will have to be hardcoded unfortunately)
# stands used to mark exits in structures don't need names
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=!roomCenter, x=~, y=~, z=~-2, dx=1, dy=1, dz=1] ~ ~ ~ tag @s add negZExit
execute @e[tag=negZExit] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~-16 summon minecraft:armor_stand checkConnection
kill @e[tag=negZExit]

# no going back during path generation
# this prevents the algorithm from getting stuck with a room that can't go anywhere
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=!roomCenter, x=~-2, y=~, z=~, dx=1, dy=1, dz=1] ~ ~ ~ tag @s add negXExit
execute @e[tag=negXExit] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=roomCenter] ~-16 ~ ~ summon minecraft:armor_stand checkConnection
# we need to kill this one after room connections are checked but before new rooms are generated
execute @e[type=minecraft:armor_stand, name=roomCenter] ~-16 ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep, x=~, y=~, z=~, dx=0, dy=1, dz=0] add negXExit

execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=!roomCenter, x=~, y=~, z=~2, dx=1, dy=1, dz=1] ~ ~ ~ tag @s add posZExit
execute @e[tag=posZExit] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~16 summon minecraft:armor_stand checkConnection
kill @e[tag=posZExit]

execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=!roomCenter, x=~2, y=~, z=~, dx=1, dy=1, dz=1] ~ ~ ~ tag @s add posXExit
execute @e[tag=posXExit] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=roomCenter] ~16 ~ ~ summon minecraft:armor_stand checkConnection
kill @e[tag=posXExit]

# then kill all the armor stands that are out of bounds
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, x=~1, y=~, z=~1, dx=63, dz=63] add inBounds
kill @e[type=minecraft:armor_stand, name=checkConnection, tag=!inBounds]
tag @e[tag=inBounds] remove inBounds

# at this point if there are no armor stands near previously generated rooms,
# we regenerate the room

# TODO: this is not a sufficient condition to make a path
# armor stands can be summoned into adjacent rooms that don't connect

# noReroll is for the entrance
tag @e[type=minecraft:armor_stand, name=roomCenter, tag=!noReroll] add reroll
# if there is an checkConnection near a generated room, do not reroll
execute @e[type=minecraft:armor_stand, name=generated] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=checkConnection, r=1] ~ ~ ~ tag @e[tag=reroll] remove reroll
# the exit marker near generated has served its purpose, remove it to prevent overwriting old rooms
execute @e[type=minecraft:armor_stand, name=generated] ~ ~ ~ kill @e[type=minecraft:armor_stand, name=checkConnection, r=1]

# now that we're done checking for connection points, remove negX exits so they don't generate
# this prevents the algorithm getting stuck generating a room that has nowhere to go
kill @e[tag=negXExit]

# TODO: kill any exit markers on top of other exit markers here?
# doesn't seem totally necessary but might be a little more efficient

# if not rerolling, mark current exits as keepers
execute @e[type=minecraft:armor_stand, name=roomCenter, tag=!reroll] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection] add keep
# if we're rerolling, we need to kill any exit stands summoned this round
kill @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep]

# now we replace the entrance room's center armor stand
# with one to indicate this room has already been generated
# (so we can kill any armor stands that end up here later) 
execute @e[type=minecraft:armor_stand, name=roomCenter, tag=!reroll] ~ ~ ~ summon minecraft:armor_stand generated
kill @e[type=minecraft:armor_stand, name=roomCenter, tag=!reroll]


# and we can generate new rooms from the armor stands we teleported earlier
tag @r[type=minecraft:armor_stand, name=checkConnection, c=1] add nextRoom
# don't progress to a new room when rerolling
execute @e[tag=reroll] ~ ~ ~ tag @e[tag=nextRoom] remove nextRoom
execute @e[tag=nextRoom] ~ ~ ~ summon minecraft:armor_stand roomCenter
kill @e[tag=nextRoom]

tag @e[tag=reroll] remove reroll