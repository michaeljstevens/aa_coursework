require_relative "battleship"
require_relative "board"

class ComputerPlayer
  attr_accessor :player, :board

  def initialize(player = nil, board = Board.new)
    @player = player
    @board = board
  end


  def get_play
    duplicate = true
    until duplicate == false
      position = board.random_position
      unless [:x, :o].include?(board[position])
        return position
        duplicate = false
      end
    end
  end
end
