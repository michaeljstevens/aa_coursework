require 'rspec'
require 'TowersOfHanoi'

describe "TowersOfHanoi" do
  subject(:game) { TowersOfHanoi.new }
  describe "#initialize" do
    it "makes an array of arrays with size 3" do
      expect(game.board).to eq( [[3,2,1], [], []] )
    end
  end

  describe "#move" do
    let(:new_move) { [0, 2] }

    it "changes the board" do
      game.move(new_move)
      expect(game.board).not_to eq( [[3,2,1], [], []] )
    end

    it "does make a move" do
      game.move(new_move)
      expect(game.board).to eq( [[3,2], [], [1]] )
    end

    it "should raise error for invalid moves" do
      game.move(new_move)
      expect{ game.move(new_move) }.to raise_error("Invalid move!")
    end
  end

  describe "#won" do
    let(:won_board) { [[], [3,2,1], []] }
    let(:fail_board) { [[], [3], [2,1]] }
    it "should end the game if win conditions are met" do
      expect(game.won?(won_board)).to be(true)
    end

    it "should not end the game if win conditions are not met" do
      expect(game.won?(fail_board)).to be(false)
    end
  end
end
