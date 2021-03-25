# dig
execute Dunstad ~ ~ ~ fill ~-1 ~ ~-1 ~1 ~2 ~1 air

# build
execute Dunstad ~ ~ ~ fill ~-2 ~-1 ~-2 ~2 ~3 ~2 glass 0 hollow
execute Dunstad ~ ~ ~ fill ~-1 ~ ~-1 ~1 ~2 ~1 air 0 replace glass

# snowball brush
execute @e[type=snowball] ~ ~ ~ fill ~-1 ~-1 ~-1 ~1 ~1 ~1 stained_glass 0 replace glass

# hearthstone
execute @e[type=item, name=hearthstone] ~ ~ ~ tp @p @e[type=armor_stand, name=hub]
kill @e[type=item, name=hearthstone]

# petrify
# straight line doesn't work, run condition through empty blocks
# then branch replacers off those
execute Dunstad ~ ~ ~ fill ~-1 ~-1 ~-1 ~1 ~2 ~1 stone 0 replace grass
execute Dunstad ~ ~ ~ fill ~-1 ~-1 ~-1 ~1 ~2 ~1 stone 0 replace dirt
execute Dunstad ~ ~ ~ fill ~-1 ~-1 ~-1 ~1 ~2 ~1 stone 0 replace leaves
execute Dunstad ~ ~ ~ fill ~-1 ~-1 ~-1 ~1 ~2 ~1 stone 0 replace log
execute Dunstad ~ ~ ~ fill ~-1 ~-1 ~-1 ~1 ~2 ~1 stone 0 replace sand

# count entities in area, save to scoreboard (x, dx)
# exclude items
scoreboard objectives add count dummy
execute @p -160 4 56 scoreboard players set gladiator count 0
execute @e[x=-160, y=4, z=56, dx=4, dy=4, dz=4, type=!item] ~ ~ ~ scoreboard players add gladiator count 1

# move monsters
# what do maxrange and distance do exactly?s
spreadplayers -165 5 1 4 @e[x=-160, y=4, z=56, dx=4, dy=4, dz=4]

# stairs in front
# need to be able to determine player's facing (ry, rym)

#sphere

# what is family entity selector?

# effects
playsound beacon.power @p ~ ~ ~ 1
particle minecraft:end_chest ~ ~1 ~

# change villager job
event entity @e[type=villager] minecraft:become_librarian
event entity @e[type=villager] minecraft:resupply_trades

# village hero
effect @s village_hero 10 4

# load appears to put lowest corner of structure at specified coordinate

# if 5 emeralds
# compare the real hopper with one that has 5 emeralds inside
testforblocks 1 1 1 1 1 1 2 2 2 
# open door
fill 1 2 3 4 5 6 air 0 replace quartz_block
playsound tile.piston.in @p ~ ~ ~


#  ------

# TODO: design floor controls

# copy floor button
# probably need to execute per room
execute @e[type=minecraft:armor_stand] ~ ~ ~ structure save roomCopy ~-4 ~-1 ~-8 ~19 ~24 ~15

# delete floor button
# kill exit and lastRoom stands
kill @e[type=minecraft:armor_stand, name=!randomRoom, x=~-4, y=~-1, z=~-9, dx=23, dy=23, dz=99999]
# kill randomRoom stands on top of other randomRoom stands
execute @e[type=minecraft:armor_stand, name=randomRoom, x=~, y=~, z=~, dx=99999, dy=0, dz=0] ~ ~ ~ kill @e[type=minecraft:armor_stand, name=randomRoom, r=1]
# fill air based on randomRoom location
fill ~-4 ~-1 ~-19 ~19 ~24 ~4 air
# kill remaining randomRoom stands
kill @e[type=minecraft:armor_stand, name=randomRoom, x=~-4, y=~-1, z=~-9, dx=23, dy=23, dz=99999]