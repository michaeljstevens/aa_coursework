require 'rspec'
require 'deck'

describe "deck" do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "should create a deck" do
      expect(deck.dealer_pile).not_to be(nil)
    end
    it "should create a deck of 52 cards" do
      expect(deck.dealer_pile.size).to be(52)
    end
    it "should have exactly four different suits" do
      suits = []
      deck.dealer_pile.each do |card|
        suits << card.suit unless suits.include?(card.suit)
      end
      expect(suits.size).to be(4)
    end
    it "should have exactly 13 different values" do
      values = []
      deck.dealer_pile.each do |card|
        values << card.value unless values.include?(card.value)
      end
      expect(values.size).to be(13)
    end
  end
end
