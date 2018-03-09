class Cell
  attr_accessor :has_treasure

  # in ruby, def initialize is the constructor
  # a constructor is the method that's called when you create a new instance of that class
  # constructors are for setting up class data to start
  def initialize
    @has_character = false
  end

  def remove_character
    @has_character = false
  end

  def place_character
    @has_character = true
  end

  def place_treasure
    @has_treasure = true
  end

  def remove_treasure
    @has_treasure = false
  end

  def to_s
    if @has_character
      "@"
    elsif @has_treasure
      "*"
    else
      "-"
    end
  end
end

class RogueBoard
  def initialize
    @size = 5
    @grid = Array.new(@size) { Array.new(@size) {Cell.new}}

    # place character
    @character_row = 0
    @character_col = 1
    @grid[@character_row][@character_col].place_character

    # place a treasure
    @grid[3][3].place_treasure
  end

  def rows
    @grid
  end

  def move_character(direction)
    # find where the character currently is
    # find the new cell they should be in
    new_character_row = @character_row
    new_character_col = @character_col
    if direction == "d"
      new_character_row += 1
    elsif direction == "u"
      new_character_row -= 1
    elsif direction == "r"
      new_character_col += 1
    elsif direction == "l"
      new_character_col -= 1
    end
    # if it's valid, move them there (removing from the old one)
    if new_character_row < @size && new_character_row >= 0 &&
      new_character_col < @size && new_character_col >= 0
      @grid[@character_row][@character_col].remove_character
      @grid[new_character_row][new_character_col].place_character
      # update the character position
      @character_row = new_character_row
      @character_col = new_character_col

      # if there's treasure in the new position, remove it
      if @grid[@character_row][@character_col].has_treasure
        @grid[@character_row][@character_col].remove_treasure
      end
    end
  end
end