require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require 'byebug'
class Game
  attr_accessor :player_one, :player_two, :board, :current

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    player_one.mark = :X
    player_two.mark = :O
    @board = Board.new
    @current = player_one
  end

  def current_player
    current
  end

  def switch_players!
    if current == player_one
      self.current = player_two
    else
      self.current = player_one
    end
  end

  def play_turn
    place = current.get_move
    board.place_mark(place, current.mark)
    switch_players!
    current.display(board)
  end

  def play
    current.display(board)
    until board.over?
      play_turn
    end
    if board.winner == player_one.mark
      puts "#{player_one.mark} wins!"
    elsif board.winner == player_two.mark
      puts "#{player_two.mark} wins!"
    else
      puts "Cat's Game!"
    end
  end
end

if $PROGRAM_NAME == __FILE__
  michael = ComputerPlayer.new('michael')
  david = HumanPlayer.new('david')
  new_game = Game.new(michael, david)
  new_game.play
end
