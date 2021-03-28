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
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ execute @e[type=minecraft:armor_stand, name="", x=~, y=~, z=~-2, dx=1, dy=1, dz=1] ~ ~ ~ summon minecraft:armor_stand checkConnection
# the max exit stand distance from room center is 4.1ish, 4.5 is good enough
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ tp @e[type=minecraft:armor_stand, name=checkConnection, c=1, rm=0, r=4.5] ~ ~ ~-14 facing ~ ~ ~-15

# no going back during path generation
# this prevents the algorithm from getting stuck with a room that can't go anywhere
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ execute @e[type=minecraft:armor_stand, name="", x=~-2, y=~, z=~, dx=1, dy=1, dz=1] ~ ~ ~ summon minecraft:armor_stand checkConnection
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ tp @e[type=minecraft:armor_stand, name=checkConnection, c=1, rm=0, r=4.5] ~-14 ~ ~ facing ~-15 ~ ~
# we need to kill this one after room connections are checked but before new rooms are generated
execute @e[type=minecraft:armor_stand, name=roomCenter] ~-14 ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep, x=~, y=~, z=~, dx=0, dy=1, dz=0] add negXConnection

execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ execute @e[type=minecraft:armor_stand, name="", x=~, y=~, z=~2, dx=1, dy=1, dz=1] ~ ~ ~ summon minecraft:armor_stand checkConnection
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ tp @e[type=minecraft:armor_stand, name=checkConnection, c=1, rm=0, r=4.5] ~ ~ ~14 facing ~ ~ ~15

execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ execute @e[type=minecraft:armor_stand, name="", x=~2, y=~, z=~, dx=1, dy=1, dz=1] ~ ~ ~ summon minecraft:armor_stand checkConnection
execute @e[type=minecraft:armor_stand, name=roomCenter] ~ ~ ~ tp @e[type=minecraft:armor_stand, name=checkConnection, c=1, rm=0, r=4.5] ~14 ~ ~ facing ~15 ~ ~

# then kill all the armor stands that are out of bounds
# TODO: extend posX safe zone
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, x=~1, y=~, z=~1, dx=63, dz=63] add inBounds
kill @e[type=minecraft:armor_stand, name=checkConnection, tag=!inBounds]
tag @e[tag=inBounds] remove inBounds

# at this point if there are no armor stands near previously generated rooms,
# we regenerate the room

# noReroll is for the entrance
tag @e[type=minecraft:armor_stand, name=roomCenter, tag=!noReroll] add reroll

# if there is a checkConnection near a room exit marker, do not reroll
execute @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep] ~ ~ ~ execute @e[type=minecraft:armor_stand, name="", x=~, y=~, z=~, dx=1, dy=1, dz=1] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, c=1] add connected
# execute @e[tag=connected, c=1] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=checkConnection, tag=!connected, tag=!negXConnection, c=1] ~ ~ ~ tag @e[tag=reroll] remove reroll
execute @e[tag=connected, c=1] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=checkConnection, tag=!connected, tag=!negXConnection, c=1] ~ ~ ~ tag @e[tag=reroll] add canEnter
# execute @e[tag=connected, c=1] ~ ~ ~ tag @e[tag=reroll] remove reroll
# the connection checker near the exit marker has served its purpose, remove it to prevent overwriting old rooms
execute @e[tag=connected] ~ ~ ~ kill @s

# now that we're done checking for connection points, remove negX exits so they don't generate
# this prevents the algorithm getting stuck generating a room that has nowhere to go
kill @e[tag=negXConnection]
# leave the exit marker stands so other rooms can see how to connect

# kill connection stands when not connected but room is already generated
execute @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep] ~ ~ ~ execute @e[type=minecraft:armor_stand, name="", rm=0, r=5.5, c=1] ~ ~ ~ kill @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep, c=1]

# out of bounds connections have been killed
# negX connections have been killed
# connections to other rooms have been killed
# connections that would overwrite existing rooms have been killed
# only connections to empty spaces should remain (and keep tagged connections from old rounds)

# check if any room exits will remain
execute @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep, c=1] ~ ~ ~ tag @e[tag=reroll] add canExit
# check if there are other rooms left to generate
execute @e[type=minecraft:armor_stand, name=checkConnection, tag=keep, c=1] ~ ~ ~ tag @e[tag=reroll] add roomsRemain

# keep this room if (we can enter and exit it) or (we can enter and there are other rooms left to generate)
tag @e[tag=canEnter, tag=canExit] remove reroll
tag @e[tag=canEnter, tag=roomsRemain] remove reroll

# if not rerolling, mark current exits as keepers
execute @e[type=minecraft:armor_stand, name=roomCenter, tag=!reroll] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection] add keep
# if we're rerolling, we need to kill any connection stands summoned this round
kill @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep]
# and the exit markers
execute @e[type=minecraft:armor_stand, name=roomCenter, tag=reroll] ~ ~ ~ kill @e[type=minecraft:armor_stand, name="", rm=0, r=4.5]

kill @e[type=minecraft:armor_stand, name=roomCenter, tag=!reroll]


# and we can generate new rooms from the armor stands we teleported earlier
tag @r[type=minecraft:armor_stand, name=checkConnection, c=1] add nextRoom
# don't progress to a new room when rerolling
execute @e[tag=reroll] ~ ~ ~ tag @e[tag=nextRoom] remove nextRoom
execute @e[tag=nextRoom] ^ ^ ^2 summon minecraft:armor_stand roomCenter
kill @e[tag=nextRoom]

tag @e[tag=canEnter] remove canEnter
tag @e[tag=canExit] remove canExit
tag @e[tag=roomsRemain] remove roomsRemain
tag @e[tag=reroll] remove reroll