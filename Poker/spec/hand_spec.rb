require 'rspec'
require 'hand'
require 'card'
describe "hand" do
  let(:card1) { double("card1", :value => 1, :suit => "diamond") }
  let(:card2) { double("card2", :value => 4, :suit => "diamond") }
  let(:card3) { double("card3", :value => 5, :suit => "diamond") }
  let(:card4) { double("card4", :value => 8, :suit => "diamond") }
  let(:card5) { double("card5", :value => 9, :suit => "spade") }
  let(:card6) { double("card6", :value => 10, :suit => "club") }
  let(:card7) { double("card7", :value => 11, :suit => "heart") }
  let(:card8) { double("card8", :value => 12, :suit => "spade") }
  let(:card9) { double("card9", :value => 3, :suit => "heart") }
  let(:card10) { double("card10", :value => 4, :suit => "spade") }
  # describe "#initialize" do
  #   it "should have five cards" do
  #
  #     expect(hand.cards.count).to be(5)
  #   end
  # end

  describe "#hand_strength" do

    describe "#royal_flush?" do
      let(:cards) { [Card.new(9, "spade"), Card.new(10, "spade"),
      Card.new(11, "spade"), Card.new(12, "spade"), Card.new(13, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 10 for royal flush" do
        expect(hand.hand_strength).to be(10)
      end
    end

    describe "#straight_flush?" do
      let(:cards) { [Card.new(8, "spade"), Card.new(9, "spade"),
      Card.new(10, "spade"), Card.new(11, "spade"), Card.new(12, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 9 for straight flush" do
        expect(hand.hand_strength).to be(9)
      end
    end

    describe "#four_kind?" do
      let(:cards) { [Card.new(8, "spade"), Card.new(8, "diamond"),
      Card.new(8, "heart"), Card.new(8, "club"), Card.new(12, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 8 for four of a kind" do
        expect(hand.hand_strength).to be(8)
      end
    end

    describe "#full_house?" do
      let(:cards) { [Card.new(8, "spade"), Card.new(8, "diamond"),
      Card.new(8, "heart"), Card.new(12, "club"), Card.new(12, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 7 for full house" do
        expect(hand.hand_strength).to be(7)
      end
    end

    describe "#flush?" do
      let(:cards) { [Card.new(2, "spade"), Card.new(4, "spade"),
      Card.new(5, "spade"), Card.new(7, "spade"), Card.new(12, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 6 for flush" do
        expect(hand.hand_strength).to be(6)
      end
    end

    describe "#straight?" do
      let(:cards) { [Card.new(3, "diamond"), Card.new(2, "spade"),
      Card.new(4, "spade"), Card.new(5, "spade"), Card.new(6, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 5 for straight" do
        expect(hand.hand_strength).to be(5)
      end
    end

    describe "#three_kind?" do
      let(:cards) { [Card.new(3, "diamond"), Card.new(3, "spade"),
      Card.new(3, "heart"), Card.new(5, "spade"), Card.new(6, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 4 for three of a kind" do
        expect(hand.hand_strength).to be(4)
      end
    end

    describe "#two_pair?" do
      let(:cards) { [Card.new(3, "diamond"), Card.new(3, "spade"),
      Card.new(4, "heart"), Card.new(4, "spade"), Card.new(6, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 3 for two pair" do
        expect(hand.hand_strength).to be(3)
      end
    end

    describe "#pair?" do
      let(:cards) { [Card.new(3, "diamond"), Card.new(3, "spade"),
      Card.new(4, "heart"), Card.new(5, "spade"), Card.new(6, "spade")] }
      let(:hand) { Hand.new(cards) }
      it "should return 2 for a pair" do
        expect(hand.hand_strength).to be(2)
      end
    end

    describe "highcard" do

      let(:cards) { [card1, card2, card3, card4, card5] }
      let(:hand) { Hand.new(cards) }
      it "should return 1 for high card" do
        expect(hand.hand_strength).to be(1)
      end
    end
  end

  describe "#compare" do
    let(:cards1) { [card1, card2, card3, card4, card5] }
    let(:cards2) { [card2, card10, card3, card4, card5] }
    let(:hand1) { Hand.new(cards1) }
    let(:hand2) { Hand.new(cards2) }

    it "should return the winning hand" do
      expect(hand1.compare(hand2)).to eql(hand2)
    end

    it "should return a tie" do
      expect(hand1.compare(hand1)).to eq("House loses!")
    end
  end

end

# let(:card) {double("card" value = 3 suit = "diamond")}
