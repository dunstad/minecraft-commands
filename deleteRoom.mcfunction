# to be called by the delete room button on room frames
# in case of accidental deletion
structure save deleted ~-4 ~-1 ~-9 ~19 ~24 ~14
execute @e[type=minecraft:armor_stand, name=lastRoom, x=~-3, y=~, z=~13, dx=0, dy=0, dz=0] ~ ~ ~ tp @s ~ ~ ~-24
kill @e[type=minecraft:armor_stand, x=~-4, y=~-1, z=~-9, dx=23, dy=23, dz=23]
fill ~-4 ~-1 ~-9 ~19 ~24 ~14 air