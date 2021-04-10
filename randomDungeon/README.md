# Random Dungeons

![Random Dungeons](./pack_icon.png "Random Dungeons") 
### Generate Spelunky-style random dungeons in Minecraft (Bedrock Edition) with one command!

---

### Useful Commands:

Generate a starter dungeon in one command:
- ```function instantDungeon```

Remake the dungeon after you've made some changes:
- ```function makeDungeon```

Control which rooms are used in generation:
- ```tag @e[type=armor_stand, c=1] add floor1```
- ```tag @e[tag=chosenFloor] remove chosenFloor```
- ```tag @e[tag=floor1] add chosenFloor```

---

### Tips & Limitations

- I recommend you build a nice looking frame around your dungeon to prevent people walking out the sides or entering/exiting from rooms other than the entrance and exit.
  - Command blocks and redstone can be used in room templates, and could be good options for opening doors in the right entrance and exit locations.
- When you press the frame's delete button or copy button, the deleted frame is saved as a structure named 'deleted'. The same applies for the overwritten area when using the copy button.
  - Unfortunately the deleted structure can save with the delete button powered. To get around this, disable command blocks when loading it.
- Trapdoors and doors in room templates may end up turned the wrong way in the actual dungeon if you've right clicked them after placing.
- If the exit stand positions are in the way of your room design, consider building the floor of your room higher up, with the exit marker stands underneath or inside it.
- Sometimes you have to press the copy buttons on the frame twice for them to work. This is because the structures save with the button still powered, and it won't go back to normal until pressed again.
- The dungeon always generates in the positive X axis direction. If you want it to face a different way, I recommend saving the dungeon as a structure after it generates and loading it in again.
- If you want a bigger dungeon, I recommend generating more than one and connecting them.

---

### Important Tags

#### External (use them how you like):

- decoration
  - Give this to armor stands you use as decoration in rooms, or else they'll die in generation
- chosenFloor
  - Give this to any entranceRoom, randomRoom or exitRoom stands you want to be used in generation.

#### Internal (don't touch!):

- keep
- fillStand
- floorExit
- inBounds
- connected
- reroll
- negXConnection
- canEnter
- canExit
- floorHasExit
- nextRoom
- rotation
- generating
- generated

### Important Names

- entranceRoom
- randomRoom
- exitRoom
- negXZBorder
- posXZBorder
- roomCenter
- checkConnection
- floorExit
- makeEntranceRoom
- 0_degrees
- 90_degrees
- 180_degrees
- 270_Degrees
