# to be called by the delete room button on room frames
# in case of accidental deletion
structure save deleted ~-4 ~-2 ~-6 ~19 ~21 ~17
kill @e[type=minecraft:armor_stand, x=~-4, y=~-2, z=~-6, dx=23, dy=23, dz=23]
fill ~-4 ~-2 ~-6 ~19 ~21 ~17 air