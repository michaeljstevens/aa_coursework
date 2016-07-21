require_relative 'player'
require_relative 'deck'
require_relative 'hand'

class Game
  attr_accessor :current_player, :current_bet, :pot, :shuffled
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
    hand1 = @deck.dealer_pile.pop(5)
    hand2 = @deck.dealer_pile.pop(5)
    @player1 = Player.new(player1, hand1)
    @player2 = Player.new(player2, hand2)
  end

  def play
    call = false
    fold = false
    until call || fold
      action = @current_player.take_action
      if action == "fold"
        fold = true
        break
      elsif action == "call"
        call = true
        @pot += @current_bet
        if @switched
          best_hand = @player1.hand.compare(@player2.hand)
          if best_hand == @player1.hand
            puts "#{@player1.name} wins the pot!"
          else
            puts "#{@player2.name} wins the pot!"
          end
        end
        @current_bet = 0
      else
        @current_bet = action
        @pot += action
      end

      switch!
    end
    unless @shuffled
      get_shuffle
      play
    else
      puts "#{@player1.name} has #{@player1.pot}"
      puts "#{@player2.name} has #{@player2.pot}"
      puts "Game over!"
    end
  end

  def get_shuffle
    n1 = @player1.shuffle
    n2 = @player2.shuffle
    @player1.hand += @deck.dealer_pile.pop(n1)
    @player2.hand += @deck.dealer_pile.pop(n2)
    @shuffled = true
  end

  def switch!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end
