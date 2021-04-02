# to be called by the copy room buttons on room frames

# save armor stands only
# structures w/o blocks don't load properly using commands
# fix: save a structure with blocks excluding the copy command blocks
structure save roomStands ~0 ~0 ~1 ~16 ~16 ~11
# clone the frame (can't use structure or command blocks copy infinitely)
clone ~-4 ~-1 ~-8 ~19 ~22 ~15 ~-4 ~-1 ~16
kill @e[x=~-4, y=~-1, z=~16, dx=23, dy=23, dz=23]
structure load roomStands ~0 ~0 ~25