require_relative 'player'
require_relative 'deck'
require_relative 'hand'
require 'byebug'

class Game
  attr_accessor :current_player, :current_bet, :pot, :shuffled, :deck

  def initialize(player1, player2)
    @deck = Deck.new
    deck.dealer_pile.shuffle!
    create_players(player1, player2)
    @current_player = @player1
    @pot = 0
    @current_bet = 0
    @shuffled = false
  end

  def create_players(player1, player2)
    hand1 = Hand.new(@deck.dealer_pile.pop(5))
    hand2 = Hand.new(@deck.dealer_pile.pop(5))
    @player1 = Player.new(player1, hand1)
    @player2 = Player.new(player2, hand2)
  end

  def play
    until game_over?
      play_pot
      unless @shuffled
        get_shuffle
        # debugger
      end
    end
  end

  def play_pot
    call = false
    fold = false
    until call || fold
      action = @current_player.take_action(@current_bet)
      case action
      when "fold"
        fold = true
        break
      when "call"
        call = true
        @pot += @current_bet
        pot_winner if @shuffled
      else
        @current_bet = action
        @pot += action
      end
      switch!
    end
  end

  def pot_winner
    best_hand = @player1.hand.compare(@player2.hand)
    if best_hand == @player1.hand
      puts "#{@player1.name} wins the pot!"
      @player1.pot += @pot
    else
      puts "#{@player2.name} wins the pot!"
      @player2.pot += @pot
    end
    @current_bet = 0
    @pot = 0
    @shuffled = true
  end

  def game_over?
    if @player1.pot.zero? || @player2.pot.zero?
      puts "#{@player1.name} has #{@player1.pot}"
      puts "#{@player2.name} has #{@player2.pot}"
      puts "Game over!"
      true
    else
      false
    end
  end

  def get_shuffle
    n1 = @player1.shuffle
    n2 = @player2.shuffle
    @player1.hand.cards += @deck.dealer_pile.pop(n1)
    @player2.hand.cards += @deck.dealer_pile.pop(n2)
    @shuffled = true
  end

  def switch!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end

game = Game.new("michael1", "michael2")
game.play
