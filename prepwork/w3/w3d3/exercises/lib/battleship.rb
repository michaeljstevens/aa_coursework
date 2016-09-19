require 'byebug'
require_relative "board"
require_relative "player"
require_relative "computerplayer"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @board = board
    @player = player
  end

  def attack(pos)
    if board.empty?(pos)
      if self.board[pos] == :s
        self.board[pos] = :o
        puts "Hit!"
        puts ""
      else
        self.board[pos] = :x
        puts "Miss!"
        puts ""
      end
    else
      puts "Please choose an empty location"
    end
  end

  def count
    board.count
  end

  def game_over?
    if board.won?
      puts "You win!"
      true
    end
  end

  def play
    until game_over?
      play_turn
    end
  end

  def play_turn
    board.display
    pos = player.get_play(board)
    attack(pos)
  end
end

if __FILE__ == $PROGRAM_NAME
  game = BattleshipGame.new(HumanPlayer.new, Board.new)
  5.times { game.board.place_random_ship }
  game.play
end
