tag @r[tag=spawning, type=armor_stand] add nextMonster
execute @e[tag=nextMonster, type=armor_stand] ~~~ structure load monsterDispenser ~ ~1 ~
execute @e[tag=nextMonster, type=armor_stand] ~~~ setblock ~ ~2 ~ redstone_block
tag @e[tag=nextMonster, type=armor_stand] remove spawning
# used for cleaning up the dispensers and stands
tag @e[tag=nextMonster, type=armor_stand] add monsterSpawned
tag @e[tag=nextMonster, type=armor_stand] remove nextMonster