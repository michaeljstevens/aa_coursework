require "byebug"
class HumanPlayer

  attr_accessor :player, :board

  def initialize(player = nil, board = Board.new)
    @player = player
    @board = board
  end

  def setup
  end

  def get_play(board)
    puts "Row to attack?"
    row = gets.chomp
    puts "Column to attack?"
    column = gets.chomp
    [row.to_i, column.to_i]
  end
end
