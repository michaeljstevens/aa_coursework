require 'byebug'
class HumanPlayer
  attr_accessor :name, :board, :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
    board.grid.each do |row|
      p row
    end
  end

  def get_move
    move = []
    puts "Where"
    input = gets.chomp
    input.split(", ").each { |char| move << Integer(char) }
    move
  end
end
