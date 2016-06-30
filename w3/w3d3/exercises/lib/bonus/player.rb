require "byebug"
require_relative "ships"
class HumanPlayer

  attr_accessor :name, :board, :ships
  @@two_ship_grid = [[:s, :s], [nil, nil]]

  def initialize(name = nil, board = Board.new)
    @name = name
    @board = board
    @ships = Ships.new
  end

  def direction(ship)
    puts "Choose direction for #{ship} (up, down, left, right)"
    direction = gets.chomp
  end

  def setup
    ship_names = ships.ships.keys
    ship_names.each do |ship|
      board.display
      puts "Choose start row for #{ship}"
      row = gets.chomp.to_i
      puts "Choose start column for #{ship}"
      col = gets.chomp.to_i
      pos = [row, col]
      length = ships.ships[ship]
      dir = direction(ship)

      case dir
      when "up"
        if board.grid[(row - length), col].nil?
          puts "Keep #{ship} fully on board. Length is #{length}"
          dir = direction(ship)
        end
        i = 1
        until i > length
          board[pos] = :s
          row -= 1
          pos = [row, col]
          i += 1
        end
      when "down"
        if board.grid[(row + length), col].nil?
          puts "Keep #{ship} fully on board. Length is #{length}"
          dir = direction(ship)
        end
        i = 1
        until i > length
          board[pos] = :s
          row += 1
          pos = [row, col]
          i += 1
        end
      when "left"
        if board.grid[row, (col - length)].nil?
          puts "Keep #{ship} fully on board. Length is #{length}"
          dir = direction(ship)
        end
        i = 1
        until i > length
          board[pos] = :s
          col -= 1
          pos = [row, col]
          i += 1
        end
      when "right"
        if board.grid[row, (col + length)].nil?
          puts "Keep #{ship} fully on board. Length is #{length}"
          dir = direction(ship)
        end
        i = 1
        until i > length
          board[pos] = :s
          col += 1
          pos = [row, col]
          i += 1
        end
      else
        puts "Wrong input"
      end
    end
  end

  def get_play
    puts "Row to attack?"
    row = gets.chomp
    puts "Column to attack?"
    column = gets.chomp
    [row.to_i, column.to_i]
  end
end
