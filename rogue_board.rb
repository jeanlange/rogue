class RogueBoard
  def initialize
    size = 2
    @grid = Array.new(size) { Array.new(size) {"_"}} 
  end

  def rows
    @grid
  end
end