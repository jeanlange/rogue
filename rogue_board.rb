class Cell
  # in ruby, def initialize is the constructor
  # a constructor is the method that's called when you create a new instance of that class
  # constructors are for setting up class data to start
  def initialize
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
    size = 5
    @grid = Array.new(size) { Array.new(size) {Cell.new}}
    @grid[0][1].place_character
  end

  def rows
    @grid
  end
end