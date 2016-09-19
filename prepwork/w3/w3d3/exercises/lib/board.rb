require 'byebug'
class Board
  attr_accessor :grid

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def count
    ship_count = 0
    grid.each do |row|
      row.each { |el| ship_count += 1 if el == :s }
    end
    ship_count
  end

  def display
    puts "BATTLESHIP"
    puts "#{count} ships remain"
    i = 0
    print "  "
    grid.each do
      print "#{i}  "
      i += 1
    end
    print "\n"
    i = 0
    grid.each do |row|
      print i
      i += 1
      row.each do |el|
        if el.nil?
          print "|__"
        else
          print "|#{el}_"
        end
      end
      print "\n"
    end
  end

  def empty?(pos = nil)
    unless pos.nil?
      return false if [:s].include?(self[pos])
      return true
    end
    grid.each do |row|
      row.each do |el|
        next if el.nil?
        return false if [:s].include?(el)
      end
    end
    true
  end

  def full?(pos = nil)
    unless pos.nil?
      return true if [:s].include?(self[pos])
      return false
    end
    grid.each do |row|
      row.each do |el|
        next if [:s].include?(el)
        return false if el.nil?
      end
    end
    true
  end

  def place_random_ship
    raise "board is full" if full?
    duplicate = true
    until duplicate == false
      position = random_position
      if empty?(position)
        self[position] = :s
        duplicate = false
      end
    end
  end

  def random_position
    row = rand(grid.length)
    column = rand(grid[row].length)
    [row, column]
  end

  def won?
    empty? ? true : false
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    self.grid[row][col]
  end

  def []=(pos, mark)
    row = pos[0]
    col = pos[1]
    self.grid[row][col] = mark
  end
end
