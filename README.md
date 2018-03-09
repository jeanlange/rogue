~game board - 2d grid
~character that can move in cardinal directions
~treasures
obstacles
scrolling map
some way to win
status display



layering discussion: n-tier design
* data (bank accounts or board & player position)
* logic - check the data to see if you're allowed to/what should happen next (can I create a transaction? or can I go to this cell in this game?)
* display - doesn't make decisions, just input/outputs (check out this transaction or print out the board game state)

What responsibilities go where?

logic layer does:
* translates user actions into data changes - makes decisions about what's allowed/how
* prepares data for presentation layer