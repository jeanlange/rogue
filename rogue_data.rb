class Cell
  def initialize
    @gold = false
  end

  def has_gold?
    @gold
  end

  def place_gold
    @gold = true
  end
  
  def remove_gold
    @gold = false
  end
end

class Board
  def initialize(size)
    @size = size
    @grid = Array.new(@size) { Array.new(@size) {Cell.new}}
    # this should be random, because what if the size is smaller than these numbers?!
    @grid[rand(@size)][rand(@size)].place_gold
  end

  def cell_at(row, col)
    return @grid[row][col]
  end
end

class Character
  attr_reader :char_row, :char_col

  def initialize(row, col)
    @char_row = row
    @char_col = col
  end
  
  def is_at?(row, col)
    @char_row == row && @char_col == col  
  end
  
  def move(row, col)
    @char_row = row
    @char_col = col
  end
end