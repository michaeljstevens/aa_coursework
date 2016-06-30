require 'byebug'
class Code
  attr_reader :pegs

  PEGS = {
    R: "Red",
    G: "Green",
    B: "Blue",
    Y: "Yellow",
    O: "Orange",
    P: "Purple"
  }

  def initialize(pegs)
    @pegs = pegs
  end

  def self.random
    values = PEGS.values
    secret = []
    (0 .. 3).each do
      secret << values[rand(values.length)]
    end
    Code.new(secret)
  end

  def self.parse(input)
    format_array = []
    input_array = input.upcase.split("")
    input_array.each do |col|
      if PEGS.include?(col.to_sym)
        format_array << PEGS[col.to_sym]
      else
        raise "Input contains invalid number"
      end
    end
    Code.new(format_array)
  end

  def [](index)
    self.pegs[index]
  end


  def exact_matches(other_code)
    matches = 0
    self.pegs.each_index do |index|
      matches += 1 if self.pegs[index] == other_code.pegs[index]
    end
    matches
  end

  def color_count
    count = {}
    self.pegs.each do |color|
      if count[color].nil?
        count[color] = 1
      else
        count[color] += 1
      end
    end
    count
  end

  def near_matches(other_code)
    matches = 0
    secret_count = self.color_count
    other_count = other_code.color_count
    secret_count.each do |color, count|
      if other_count.include?(color)
        matches += [count, other_count[color]].min
      end
    end
    matches - self.exact_matches(other_code)
  end

  def ==(object)
    return false unless object.is_a?(Code)
    self.pegs == object.pegs
  end

end

class Game
  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def play
    hash = {
      R: "Red",
      G: "Green",
      B: "Blue",
      Y: "Yellow",
      O: "Orange",
      P: "Purple"
    }
    puts hash
    num_plays = 0
    while num_plays < 10
      puts "Make a guess"
      guess = get_guess
      if guess == secret_code
        puts "You win!"
        return
      else
        display_matches(guess)
        num_plays += 1
        puts "You have #{10 - num_plays} guesses left\n"
      end
    end
    puts "You lose! The correct answer is #{secret_code.pegs}"
  end

  def get_guess
    guess = Code.parse(gets.chomp)
  end

  def display_matches(code)
    puts "#{secret_code.near_matches(code)} near matches"
    puts "#{secret_code.exact_matches(code)} exact matches"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
