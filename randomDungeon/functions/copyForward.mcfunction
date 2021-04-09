# to be called by the copy room buttons on room frames

# save armor stands only
# structures w/o blocks don't load properly using commands
# fix: save a structure with blocks excluding the copy command blocks
structure save roomStands ~1 ~-1 ~5 ~17 ~15 ~15
# in case you overwrite something important
structure save deleted ~21 ~-2 ~-4 ~44 ~21 ~19
# clone the frame 
# can't use the structure command or else command blocks copy infinitely
clone ~-3 ~-2 ~-4 ~20 ~21 ~19 ~21 ~-2 ~-4
kill @e[x=~21, y=~-2, z=~-4, dx=23, dy=23, dz=23]
structure load roomStands ~25 ~-1 ~5