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
# 63 + 16 = 79
execute @e[type=minecraft:armor_stand, name=negXZBorder] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, x=~1, y=~, z=~1, dx=79, dz=63] add inBounds

# prepare floor exit stand
# we need to change its name from checkConnection so those systems don't see it
execute @e[type=minecraft:armor_stand, name=posXZBorder] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, x=~, y=~, z=~-64, dx=15, dz=63] add floorExit
# name=floorExit means we already have one, so remove the tag and treat it as out of bounds
execute @e[type=minecraft:armor_stand, name=floorExit] ~ ~ ~ tag @e[tag=floorExit] remove inBounds
execute @e[type=minecraft:armor_stand, name=floorExit] ~ ~ ~ tag @e[tag=floorExit] remove floorExit
execute @e[tag=floorExit] ~ ~ ~ execute @e[type=minecraft:armor_stand, name=roomCenter, c=1] ~ ~ ~ summon minecraft:armor_stand floorExit
execute @e[tag=floorExit] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=roomCenter, c=1] add noReroll
kill @e[tag=floorExit]

kill @e[type=minecraft:armor_stand, name=checkConnection, tag=!inBounds]
tag @e[tag=inBounds] remove inBounds

# at this point if there are no armor stands near previously generated rooms,
# we regenerate the room

# noReroll is for the entrance and exit
tag @e[type=minecraft:armor_stand, name=roomCenter, tag=!noReroll] add reroll

# if there is a checkConnection near a room exit marker, do not reroll
execute @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep] ~ ~ ~ execute @e[type=minecraft:armor_stand, name="", x=~, y=~, z=~, dx=1, dy=1, dz=1] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, c=1] add connected
execute @e[tag=connected, c=1] ~ ~ ~ tag @e[tag=reroll] add canEnter
# the connection checker near the exit marker has served its purpose, remove it to prevent overwriting old rooms
kill @e[tag=connected]

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
# check if we have an exit yet
execute @e[type=minecraft:armor_stand, name=floorExit] ~ ~ ~ tag @e[tag=reroll] add floorHasExit

# TODO: allow rooms we can't enter or exit if floorExit exists, to prevent infinite generation
# wait... shouldn't this not happen?

# keep this room if (we can enter and exit it) or (we can enter and there's a floor exit already)
tag @e[tag=canEnter, tag=canExit] remove reroll
tag @e[tag=canEnter, tag=floorHasExit] remove reroll

# if not rerolling, mark current exits as keepers
execute @e[type=minecraft:armor_stand, name=roomCenter, tag=!reroll] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection] add keep
# if we're rerolling, we need to kill any connection stands summoned this round
kill @e[type=minecraft:armor_stand, name=checkConnection, tag=!keep]
# and the exit markers
execute @e[type=minecraft:armor_stand, name=roomCenter, tag=reroll] ~ ~ ~ kill @e[type=minecraft:armor_stand, name="", rm=0, r=4.5]

# when rerolling, revert back to checkConnection so we don't get stuck generating one room forever
# summoned stands face +z by default, summoning at z -2 positions them for the coming teleport
execute @e[tag=reroll] ~ ~ ~-2 summon minecraft:armor_stand checkConnection
# this exit had keep when the room it came from was generated, restore it
execute @e[tag=reroll] ~ ~ ~ tag @e[type=minecraft:armor_stand, name=checkConnection, c=1] add keep
kill @e[type=minecraft:armor_stand, name=roomCenter]

# and we can generate new rooms from the armor stands we teleported earlier
tag @r[type=minecraft:armor_stand, name=checkConnection, tag=!floorExit, c=1] add nextRoom
execute @e[tag=nextRoom] ^ ^ ^2 summon minecraft:armor_stand roomCenter
kill @e[tag=nextRoom]

tag @e[tag=canEnter] remove canEnter
tag @e[tag=canExit] remove canExit
tag @e[tag=floorHasExit] remove floorHasExit
tag @e[tag=reroll] remove reroll

function genFloorExit

# TODO: fix connection stand stacking when different paths meet