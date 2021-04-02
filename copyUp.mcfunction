# to be called by the copy room buttons on room frames

# save armor stands only
# structures w/o blocks don't load properly using commands
# fix: save a structure with blocks excluding the copy command blocks
structure save roomStands ~0 ~-1 ~2 ~16 ~15 ~12
# in case you overwrite something important
# TODO: work out these coordinates
# structure save deleted ~-4 ~-2 ~-7 ~19 ~21 ~16 
# clone the frame (can't use structure or command blocks copy infinitely)
clone ~-4 ~-2 ~-7 ~19 ~21 ~16 ~-4 ~22 ~-7
kill @e[x=~-4, y=~22, z=~-7, dx=23, dy=23, dz=23]
structure load roomStands ~0 ~23 ~2