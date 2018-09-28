require './rogue_logic.rb'

size = 5
game = RogueGame.new(size)

while true
  # iterate over each position in the board
  # if the player is there, print the player
  # otherwise print the board
  (0...size).each do |row|
    (0...size).each do |col|
      if game.has_player_at?(row, col)
        print "@"
      else
        cell = game.cell_at(row,col)
        if cell.has_gold?
          print "*"
        else
          print "_"
        end
      end
    end
    puts
  end

  puts "Please enter a direction you'd like to move: u, d, l, r"
  direction = gets.chomp
  if(direction == "s" || direction == "w" || direction == "a" || direction == "d")
    game.move_character(direction)
  else
    puts "invalid input: #{direction}"
  end
end