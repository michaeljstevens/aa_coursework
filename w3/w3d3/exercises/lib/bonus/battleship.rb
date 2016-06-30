require 'byebug'
require_relative "board"
require_relative "player"
require_relative "computerplayer"

class BattleshipGame
  attr_reader :player1, :player2, :current_player, :opposing_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @opposing_player = player2
  end


  def switch_player
    if @current_player == player1
      @current_player = player2
      @opposing_player = player1
    else
      @current_player = player1
      @opposing_player = player2
    end
  end

  def attack(pos)
     if opposing_player.board[pos] == :s
      current_player.board[pos] = :x
      opposing_player.board[pos] = :x
      puts "Hit!"
      puts ""
    else
      current_player.board[pos] = :o
      opposing_player.board[pos] = :o
      puts "Miss!"
      puts ""
    end
  end

  def count
    board.count
  end

  def game_over?
    #debugger
    if current_player.board.won?
      puts "You win!"
      true
    end
  end

  def play
    player1.setup
    player2.setup
    until game_over?
      play_turn
    end
  end

  def play_turn
    puts "#{current_player.name}"
    current_player.board.display
    pos = current_player.get_play
    attack(pos)
    switch_player
    system "clear"
  end
end

if __FILE__ == $PROGRAM_NAME
  #game = BattleshipGame.new(HumanPlayer.new, Board.new)
  #2.times { game.board.place_random_ship }
  #game.play

  game = BattleshipGame.new(HumanPlayer.new("Michael"), HumanPlayer.new("Mom"))
  game.play
end
