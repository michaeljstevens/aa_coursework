class Hand

  HAND_RANK =
  {
    royal_flush: 10,
    straight_flush: 9,
    four_kind: 8,
    full_house: 7,
    flush: 6,
    straight: 5,
    three_kind: 4,
    two_pair: 3,
    pair: 2,
    high: 1
  }

  attr_accessor :cards, :suits, :values

  def initialize(cards)
    @cards = cards
    @suits = []
    @values = []

    cards.each do |card|
      suits << card.suit
      values << card.value
    end

  end



  def hand_strength
    return HAND_RANK[:royal_flush] if royal_flush?
    return HAND_RANK[:straight_flush] if straight_flush?
    return HAND_RANK[:four_kind] if four_kind?
    return HAND_RANK[:full_house] if full_house?
    return HAND_RANK[:flush] if flush?
    return HAND_RANK[:straight] if straight?
    return HAND_RANK[:three_kind] if three_kind?
    return HAND_RANK[:two_pair] if two_pair?
    return HAND_RANK[:pair] if pair?
    HAND_RANK[:high]
  end

  def compare(hand)
    my_hand = self.hand_strength
    other_hand = hand.hand_strength

    if my_hand > other_hand
      return self
    elsif other_hand > my_hand
      return hand
    else
      return "House loses!"
    end
  end


  def royal_flush?
    return false unless suits.uniq.size == 1
    return false unless values.uniq.size == 5
    return false unless values.sort == [9, 10, 11, 12, 13]
    true
  end

  def straight_flush?
    return false unless suits.uniq.size == 1
    return false unless values.uniq.size == 5
    return false unless values.sort.chunk_while do |i, j|
      i+1 == j
    end.to_a.count == 1
    true
  end

  def four_kind?
    uniqs = values.uniq
    return false unless uniqs.size == 2
    if values.count(uniqs[0]) == 4 || values.count(uniqs[1]) == 4
      return true
    end
    false
  end

  def full_house?
    uniqs = values.uniq
    if uniqs.size == 2
      if values.count(uniqs[0]) == 3 && values.count(uniqs[1]) == 2
        return true
      elsif values.count(uniqs[0]) == 2 && values.count(uniqs[1]) == 3
        return true
      end
    end
    false
  end

  def flush?
    return false unless suits.uniq.size == 1
    true
  end

  def straight?
    return false unless values.sort.chunk_while do |i, j|
      i+1 == j
    end.to_a.count == 1
    true
  end

  def three_kind?
    uniqs = values.uniq
    return false unless uniqs.size == 3
    test1 = values.count(uniqs[0]) == 3
    test2 = values.count(uniqs[1]) == 3
    test3 = values.count(uniqs[2]) == 3
    if test1 || test2 || test3
      return true
    end
    false
  end

  def two_pair?
    uniqs = values.uniq
    return false unless uniqs.size == 3
    true
  end

  def pair?
    uniqs = values.uniq
    return true if uniqs.size == 4
  end

  def high
    values.max
  end




end
