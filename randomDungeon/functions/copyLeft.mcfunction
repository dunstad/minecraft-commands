# to be called by the copy room buttons on room frames

# save armor stands only
# structures w/o blocks don't load properly using commands
# fix: save a structure with blocks excluding the copy command blocks
structure save roomStands ~0 ~0 ~3 ~16 ~16 ~13
# clone the frame 
# can't use the structure command or else command blocks copy infinitely
clone ~-4 ~-1 ~-6 ~19 ~22 ~17 ~-4 ~-1 ~-30
kill @e[x=~-4, y=~-1, z=~-30, dx=23, dy=23, dz=23]
structure load roomStands ~0 ~0 ~-21