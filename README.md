## What is, how to?
We worked on building a roguelike game where we print a board and there's a character that can move around on it.

To run it, do `ruby rogue.rb`

Works on Windows and Mac at least!

## Notes

### To do
* ~game board - 2d grid
* ~character that can move in cardinal directions
* ~treasures
* obstacles
* scrolling map
* some way to win
* status display

### Design

layering discussion: n-tier design
* data (bank accounts or board & player position)
* logic - check the data to see if you're allowed to/what should happen next (can I create a transaction? or can I go to this cell in this game?)
  * translates user actions into data changes - makes decisions about what's allowed/how
  * prepares data for presentation layer
* display - doesn't make decisions, just input/outputs (check out this transaction or print out the board game state)
  * does make decisions about how the display looks

What responsibilities go where?
* data:
  * board (where gold is, where walls are, what kind of terrrain is in each square)
  * character (current position, stats like health/#gold pieces)
* logic layer:
  * check with board: can the character move to a new position? update the character's position, update the board as needed, update character's stats as needed
  * move all the monsters
* presentation layer:
  * ask for initial setup
  * event loop
  * asks logic layer for data to print -
  	* in this position, what kind of terrain should I print?
	* in this position, is the character there? - what is the character's current position?
  * accepts input to pass to logic layer
