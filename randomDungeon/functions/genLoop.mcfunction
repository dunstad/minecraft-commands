# loop
function genRoom
function genExits
function genFloorExit

# keep generating paths until they all end
# there should only be one roomCenter at a time
execute @e[type=minecraft:armor_stand, name=roomCenter, c=1] ~ ~ ~ function genLoop