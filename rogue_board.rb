class Cell
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

  def to_s
    if @has_character
      "@"
    else
      "-"
    end
  end
end

class RogueBoard
  def initialize
    @size = 5
    @grid = Array.new(@size) { Array.new(@size) {Cell.new}}
    @character_row = 0
    @character_col = 1
    @grid[@character_row][@character_col].place_character
  end

  def rows
    @grid
  end

  def move_character(direction)
    # find where the character currently is
    # find the new cell they should be in
    if direction == "d"
      new_character_row = @character_row + 1
      new_character_col = @character_col
    end
    # if it's valid, move them there (removing from the old one)
    if new_character_row < @size
      @grid[@character_row][@character_col].remove_character
      @grid[new_character_row][new_character_col].place_character
      # update the character position
      @character_row = new_character_row
      @character_col = new_character_col
    end
  end
end