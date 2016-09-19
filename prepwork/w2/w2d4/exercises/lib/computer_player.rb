require 'byebug'
class ComputerPlayer
  attr_accessor :name, :board, :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    possible_moves = []
    [0, 1, 2].each do |row|
      [0, 1, 2].each do |col|
        possible_moves << [row, col] if board[row, col].nil?
      end
    end
    possible_moves.each do |move|
      return move if winning_move?(move)
    end
    possible_moves.sample
  end

  def winning_move?(move)
      board[*move] = mark
      if board.winner == mark
        board[*move] = nil
        return true
      else
        board[*move] = nil
        return false
      end
  end


end
