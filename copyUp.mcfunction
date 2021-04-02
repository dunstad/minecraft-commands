# to be called by the copy room button on room frames

# save armor stands only
# TODO: why is only one stand getting saved?
# it's a bug, fix: save a structure with blocks excluding the copy command blocks
structure save roomStands ~-4 ~-2 ~-7 ~19 ~21 ~16 true memory false
clone ~-4 ~-2 ~-7 ~19 ~21 ~16 ~-4 ~22 ~-7
kill @e[x=~-4, y=~22, z=~-7, dx=23, dy=23, dz=23]
structure load roomStands ~-4 ~22 ~-7

# TODO: copy in six directions
# clone + structure for entities only
# use tickingarea command to toggle which sets of rooms are loaded from

# heights (y)
# pillar 16
# roof 7
# floor 1
# total 24