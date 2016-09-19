# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  secret_number = rand(1 .. 100)
  guess_count = 0
  won = false
  until won == true
    puts "Guess a number"
    guess = gets.chomp.to_i
    guess_count += 1
    if guess == secret_number
      puts "You won! You guessed #{secret_number} in #{guess_count} tries"
      won = true
    elsif guess < secret_number
      puts "#{guess} is too low"
    else
      puts "#{guess} is too high"
    end
  end
end

def shuffle_file
  orig_file = gets.chomp
  input_name = File.basename(orig_file, ".txt")
  File.open("#{input_name}-shuffled.txt", "w") do |el|
    File.readlines(orig_file).shuffle.each do |line|
      el.puts line
    end
  end
end
if __FILE__ == $PROGRAM_NAME
  shuffle_file
end
