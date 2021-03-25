summon minecraft:armor_stand randomRoom ~ ~2 ~
scoreboard objectives add weight dummy
scoreboard players set @p weight 0
execute @e[x=~, y=~2, z=~, dx=0, dy=0, dz=0, type=minecraft:armor_stand] ~ ~ ~ scoreboard players add @p weight 1
titleraw @p actionbar { "rawtext" : [ { "score" : { "name" : "@p" , "objective" : "weight"} } ] }