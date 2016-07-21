require 'byebug'
class Player

  attr_accessor :hand, :pot, :name

  def initialize(name, hand)
    @name = name
    @hand = hand
    @pot = 100
  end

  def take_action(current_bet)
    p hand
    p self.pot
    puts "Current bet is #{current_bet}. Would you like to call(c),
    raise to(amount), or fold(f)?"

    input = gets.chomp

    if input == "c"
      @pot -= current_bet
      return "call"
    elsif input == "f"
      return "fold"
    else
      @pot -= input.to_i
      input.to_i
    end
  end

  def shuffle
    p hand
    puts "Choose which cards to discard (idx)"
    discard = gets.chomp.split(',').map{ |el| el.to_i }
    discard.each{|idx| @hand.cards.delete_at(idx) }
    discard.size
  end
end
