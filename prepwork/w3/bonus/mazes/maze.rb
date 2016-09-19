require 'byebug'
class Maze
  attr_accessor :maze, :start, :end, :position

  def initialize(maze)
    @maze = maze.map { |line| line.split("") }
  end

  def set_points
    maze.each_with_index do |line, idx1|
      line.each_with_index do |char, idx2|
        if char == "S"
          @start = [idx1, idx2]
        elsif char == "E"
          @end = [idx1, idx2]
        end
      end
    end
  end

  def set_position(pos = start)
    if position.nil?
      @position = start
    else
      @position = pos
    end
  end

  def solve
    set_position
    until solved?
      row = position[0]
      column = position[1]

      up = [row + 1, column]
      down = [row - 1, column]
      right = [row, column + 1]
      left = [row, column - 1]

      moves = valid?([up, down, left, right])
      best_move = best?(moves)
      self[best_move] = "X" unless self[best_move] == "E"
      set_position(best_move)
    end
    p maze
    puts "Solved!"
  end

  def best?(moves)
    greatest_distance = nil
    best_move = []
    moves.each do |pos|
      diff = ((@end[0] - pos[0]).abs + (@end[1] - pos[1]).abs)
      if greatest_distance.nil?
        greatest_distance = diff
        best_move = pos
      elsif diff < greatest_distance
        greatest_distance = diff
        best_move = pos
      end
    end
    best_move
  end

  def valid?(move)
    valid_moves = []
    move.each do |pos|
      if [" ", "E"].include?(self[pos])
        valid_moves << pos
      end
    end
    valid_moves
  end

  def solved?
    true if self[position] == "E"
  end
  def [](pos)
    row = pos[0]
    col = pos[1]
    self.maze[row][col]
  end

  def []=(pos, mark)
    row = pos[0]
    col = pos[1]
    self.maze[row][col] = mark
  end
end

if __FILE__ == $PROGRAM_NAME
  solver = Maze.new(File.readlines("maze1.txt"))
  solver.set_points
  solver.solve
end
