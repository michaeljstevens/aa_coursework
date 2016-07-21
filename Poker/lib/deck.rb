require_relative 'card'

class Deck

  attr_accessor :dealer_pile

  SUITS = ["spade", "heart", "club", "diamond"]

  def initialize
    @dealer_pile = []
    populate
  end

  def populate
    SUITS.each do |suit|
      (1..13).each do |value|
        @dealer_pile << Card.new(value, suit)
      end
    end
  end

end
# 
# a = Deck.new
# a.populate
# p a.dealer_pile
# p a.dealer_pile.size
