require "byebug"
class Hangman
  attr_reader :guesser, :referee, :board, :guesses_left

  def initialize(options = {})
    @referee = options[:referee]
    @guesser = options[:guesser]
    @guesses_left = 8
    @board = []
  end

  def play
    setup
    while guesses_left > 0
      p board
      take_turn
      if board.all?
        p board
        puts "Guesser wins!"
        return
      end
      @guesses_left -= 1
    end
    puts "Referee wins!"
    puts "Word was #{referee.secret_word}"
  end


  def setup
    #debugger
    secret_length = referee.pick_secret_word
    guesser.register_secret_length(secret_length)
    secret_length.times { @board << nil }
  end

  def take_turn
    guess = guesser.guess(board)
    matches = referee.check_guess(guess)
    unless matches.nil?
      update_board(matches, guess)
    end
    guesser.handle_response(guess, matches)
  end

  def update_board(matches, guess)
    matches.each { |i| @board[i.to_i] = guess }
  end
end

class HumanPlayer
  attr_reader :secret_length

  def pick_secret_word
    puts "Think of a word. How long is it?"
    Integer(gets.chomp)
  end

  def check_guess(letter)
    puts "Guess was #{letter}. Does #{letter} occur in the word?(y/n)"
    if gets.chomp == "y"
      puts "At which position(s) does #{letter} occur?"
      gets.chomp.split(", ")
    else
      nil
    end
  end

  def register_secret_length(length)
    puts "The word is #{length} letter"
  end

  def guess(board)
    puts "Choose a letter"
    letter = gets.chomp
  end

  def handle_response(guess, index)
    if index.empty?
      puts "letter not found"
    else
      puts "found #{guess} at #{index}"
    end
  end

  def secret_word
    puts "What was the word?"
    gets.chomp
  end
end

class ComputerPlayer
  attr_reader :dictionary, :secret_word, :secret_length

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def candidate_words
    dictionary
  end

  def pick_secret_word
    @secret_word = dictionary[rand(dictionary.length)]
    secret_word.length
  end

  def check_guess(letter)
    matches = []
    secret_word.split("").each_with_index do |char, index|
      matches << index if char == letter
    end
    matches
  end

  def register_secret_length(length)
    @secret_length = length
    @dictionary = dictionary.select do |word|
      word.length == @secret_length
    end
  end

  def guess(board)
    letter_hash = {}
    candidate_words.each do |word|
      word.each_char do |char|
        if letter_hash[char]
          letter_hash[char] += 1
        else
          letter_hash[char] = 1
        end
      end
    end
    board.each do |letter|
      unless letter.nil?
        letter_hash.delete(letter)
      end
    end
    letter = ""
    frequency = 0
    letter_hash.each do |key, value|
      if value > frequency
        frequency = value
        letter = key
      end
    end
    letter
    #("a" .. "z").to_a.sample
  end

  def handle_response(guess, index)
    index = index.map { |idx| idx.to_i } unless index.nil?
    if index.nil?
      @dictionary = dictionary.select do |word|
        word unless word.include?(guess)
      end
    else
      index.each do |idx|
        @dictionary = dictionary.select do |word|
          word if word[idx] == guess
        end
      end
      @dictionary = dictionary.select do |word|
        indices = []
        word.split("").each_with_index do |char, idx|
          if char == guess
            indices << idx
          end
        end
        word if indices == index
        #debugger
      end
    end
  end

end
if __FILE__ == $PROGRAM_NAME
  puts "Would you like the computer to guess?(y/n)"
  if gets.chomp == "y"
    guesser = ComputerPlayer.new(File.readlines("dictionary.txt").map(&:chomp))
  else
    guesser = HumanPlayer.new
  end

  puts "Would you like the computer to referee?(y/n)"
  if gets.chomp == "y"
    referee = ComputerPlayer.new(File.readlines("dictionary.txt").map(&:chomp))
  else
    referee = HumanPlayer.new
  end
  players_hash = {guesser: guesser, referee: referee}
  Hangman.new(players_hash).play
end
