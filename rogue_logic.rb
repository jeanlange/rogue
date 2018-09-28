require './rogue_data.rb'

class RogueGame
  def initialize(size)
    @size = size
    # create board
    @board = Board.new(@size)
    # create & place character
    @character = Character.new(0, 1)
  end
  
  def cell_at(row, col)
    @board.cell_at(row, col)
  end
  
  def has_player_at?(row, col)
    @character.is_at?(row, col)
  end

  def move_character(direction)
    # is the player allowed to go there?
    new_character_row = @character.char_row
    new_character_col = @character.char_col
    if direction == "s"
      new_character_row += 1
    elsif direction == "w"
      new_character_row -= 1
    elsif direction == "d"
      new_character_col += 1
    elsif direction == "a"
      new_character_col -= 1
    end
    # if it's valid, 
    # then update the player's position
    if new_character_row < 5 && new_character_row >= 0 &&
      new_character_col < 5 && new_character_col >= 0
      @character.move(new_character_row, new_character_col)

      # if that causes a board update, make it
      cell = cell_at(new_character_row, new_character_col)
      if cell.has_gold?
        cell.remove_gold
      end
    end
  end
end