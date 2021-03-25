kill @e[x=~, y=~3, z=~, dx=0, dy=0, dz=0, type=minecraft:armor_stand, c=1]
scoreboard objectives add weight dummy
scoreboard players set @p weight 0
execute @e[x=~, y=~3, z=~, dx=0, dy=0, dz=0, type=minecraft:armor_stand] ~ ~ ~ scoreboard players add @p weight 1
titleraw @p actionbar { "rawtext" : [ { "score" : { "name" : "@p" , "objective" : "weight"} } ] }