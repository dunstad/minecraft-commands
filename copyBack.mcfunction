# to be called by the copy room buttons on room frames

# save armor stands only
# structures w/o blocks don't load properly using commands
# fix: save a structure with blocks excluding the copy command blocks
structure save roomStands ~1 ~0 ~5 ~17 ~16 ~15
# clone the frame (can't use structure or command blocks copy infinitely)
clone ~-3 ~-1 ~-4 ~20 ~22 ~19 ~-27 ~-1 ~-4
kill @e[x=~-27, y=~-1, z=~-4, dx=23, dy=23, dz=23]
structure load roomStands ~-23 ~0 ~5