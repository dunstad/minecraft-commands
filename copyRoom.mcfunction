# to be called by the copy room button on room frames
# structure save roomCopy ~-4 ~-1 ~-8 ~19 ~24 ~15
# execute @e[type=minecraft:armor_stand, name=lastRoom, x=~-3, y=~, z=~14, dx=99999, dy=0, dz=0, c=-1] ~ ~ ~ structure load roomCopy ~-1 ~-1 ~2
# TODO: should be dz, not dx
# also with clone we'll need three steps, any way for structure to not go infinite?
execute @e[type=minecraft:armor_stand, name=lastRoom, x=~-3, y=~, z=~14, dx=99999, dy=0, dz=0, c=-1] ~ ~ ~ clone ~-1 ~-1 ~-22 ~22 ~24 ~1 ~-1 ~-1 ~2
execute @e[type=minecraft:armor_stand, name=lastRoom, x=~-3, y=~, z=~14, dx=99999, dy=0, dz=0, c=-1] ~ ~ ~ tp @s ~ ~ ~24