require 'byebug'
class Maze
  attr_accessor :maze, :start, :finish, :position

  OPEN = {}
  CLOSED = {}

  def initialize(maze)
    @maze = maze.map { |line| line.split("") }
  end

  def set_points
    maze.each_with_index do |line, idx1|
      line.each_with_index do |char, idx2|
        if char == "S"
          @start = [idx1, idx2]
          OPEN[start] = ["Start", 0]
        elsif char == "E"
          @finish = [idx1, idx2]
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

  def solved?
    CLOSED.include?(finish)
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

      CLOSED[position] = OPEN[position]
      OPEN.delete(position)
      break if position == finish

      moves = valid?([up, down, left, right])
      moves.each { |move| OPEN[move] = [position] }
      set_position(best_move(moves))
    end
    find_path
    p maze
    puts "Solved!"
  end

  def find_path
    pos = finish
    until pos == start
      pos = CLOSED[pos][0]
      self[pos] = "X" unless self[pos] == "S"
    end
  end

  def best_move(moves)
    return_move = []
    lowest_f = nil
    moves.each do |move|
      set_g_value(move)
      set_h_value(move)
      set_f_value(move)
    end
    OPEN.each do |key, value|
      if lowest_f.nil?
        return_move = key
        lowest_f = value[3]
      elsif value[3] < lowest_f
        return_move = key
        lowest_f = value[3]
      end
    end
    return_move
  end

  def set_g_value(move)
    g_value = CLOSED[position][1] + 10
    if OPEN[move][1].nil?
      OPEN[move] << g_value
    elsif OPEN[move][1] > g_value
      OPEN[move][1] = g_value
    end
  end

  def set_h_value(move)
    h_value = ((finish[0] - move[0]).abs + (finish[1] - move[1]).abs) * 10
    if OPEN[move][2].nil?
      OPEN[move] << h_value
    elsif OPEN[move][2] > h_value
      OPEN[move][2] = h_value
    end
  end

  def set_f_value(move)
    OPEN[move] << (OPEN[move][1] + OPEN[move][2])
  end


  def valid?(move)
    valid_moves = []
    move.each do |pos|
      unless CLOSED.include?(pos)
        if [" ", "E"].include?(self[pos])
          valid_moves << pos
        end
      end
    end
    valid_moves
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
