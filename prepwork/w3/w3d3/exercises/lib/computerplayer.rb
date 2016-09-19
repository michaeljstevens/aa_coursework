require_relative "battleship"
require_relative "board"

class ComputerPlayer
  attr_accessor :player, :board

  def initialize(player = nil, board = Board.new)
    @player = player
    @board = board
  end


  def get_play(board)
    duplicate = true
    until duplicate == false
      position = board.random_position
      if board.empty?(position) || board[position] == :s
        return position
        duplicate = false
      end
    end
  end
end
