require 'byebug'
class Board
  attr_accessor :grid, :marks

  def self.new_grid
    Array.new(3) { Array.new(3) }
  end

  def initialize(grid = Board.new_grid)
    @grid = grid
    @marks = [:X, :O]
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, value)
    @grid[row][col] = value
  end

  def place_mark(position, mark)
    self[*position] = mark
  end

  def empty?(position)
    true if self[*position].nil?
  end

  def winner
    grid.each do |row|
      return check_winner(row) if check_winner(row) != nil
    end

    self.columns.each do |col|
      return check_winner(col) if check_winner(col) != nil
    end

    self.diagonals.each do |diag|
      return check_winner(diag) if check_winner(diag) != nil
    end
    nil
  end

  def check_winner(set)
    if set == [:X, :X, :X]
      return :X
    elsif set == [:O, :O, :O]
      return :O
    else
      return nil
    end
  end


  def columns
    cols = [[], [], []]
    self.grid.each do |row|
      row.each_with_index do |value, index|
        cols[index] << value
      end
    end
    cols
  end

  def diagonals
    diags = [[],[]]
    diags[0] << self[0, 0] << self[1, 1] << self[2, 2]
    diags[1] << self[0, 2] << self[1, 1] << self[2, 0]
    diags
  end

  def over?
    return true if cats_game? || (winner == :X || winner == :O)
    false
  end

  def cats_game?
    self.grid.each do |row|
      return false if row.include?(nil)
    end
    true
  end
end
