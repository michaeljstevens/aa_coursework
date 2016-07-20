require 'rspec'
require 'tdd'

describe "#my_uniq" do
  let(:array) { [1, 3, 4, 1, 3, 7] }
  it "should remove duplicate entries" do
    expect(my_uniq(array)).to eq([1,3,4,7])
  end

  it "should return an empty if the array is empty" do
    expect(my_uniq([])).to eq([])
  end
end

describe "#two_sum" do
  let(:array) { [-1, 0, 2, -2, 1] }
  let(:bad_arr) { [-1, 0, 5, 3] }
  it "find all pairs of positions where the elements sum to zero" do
    expect(two_sum(array)).to eq( [[0, 4], [2, 3]] )
  end
  it "doesn't return inversed positions" do
    expect(two_sum(array)).not_to eq( [[0, 4], [2, 3], [3, 2], [4, 0]] )
  end
  it "returns an empty if no pairs of indices sum to zero" do
    expect(two_sum(bad_arr)).to eq( [] )
  end
end

describe "#my_transpose" do
  let(:arrays) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  it "should swap rows and columns while maintaining elements" do
    expect(my_transpose(arrays)).to eq( [[0, 3, 6], [1, 4, 7], [2, 5, 8]] )
  end
  it "should return itself if the array is too small to transpose" do
    expect(my_transpose([0])).to eq( [[0]] )
  end
end

describe "#stock_picker" do
  let(:stocks) { [5, 8, 2, 4, 12] }
  let(:bad_stocks) { [ 5, 4, 3, 2, 1, 0 ] }
  it "returns most profitable pair of days to buy and sell stock" do
    expect(stock_picker(stocks)).to eq([2,4])
  end
  it "returns [] if no days are profitable" do
    expect(stock_picker(bad_stocks)).to eq([])
  end
end
