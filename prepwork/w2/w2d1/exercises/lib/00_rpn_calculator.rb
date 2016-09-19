require 'byebug'
class RPNCalculator
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(num)
    @stack << num
  end

  def plus
    empty_error if @stack.empty?
    to_add = @stack[-1]
    @stack.pop
    @stack[-1] = @stack[-1] + to_add
  end

  def minus
    empty_error if @stack.empty?
    to_minus = @stack[-1]
    @stack.pop
    @stack[-1] = @stack[-1] - to_minus
  end

  def times
    empty_error if @stack.empty?
    to_times = @stack[-1]
    @stack.pop
    @stack[-1] = @stack[-1] * to_times
  end

  def divide
    empty_error if @stack.empty?
    to_divide = @stack[-1]
    @stack.pop
    @stack[-1] = @stack[-1].to_f / to_divide
  end

  def tokens(string)
    token_array = string.split(" ")
    token_array.map do |char|
      if operator?(char)
        char.to_sym
      else
        Integer(char)
      end
    end
  end

  def operator?(char)
    operators = %W(* / + -)
    return true if operators.include?(char)
    false
  end

  def evaluate(string)
    digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    eval_array = tokens(string)
    eval_array.each do |char|
      self.push(char) if digits.include?(char)
      self.times if char == :*
      self.divide if char == :/
      self.plus if char == :+
      self.minus if char == :-
    end
    self.value
  end

  def value
    @stack[-1]
  end

  def empty_error
    raise "calculator is empty"
  end

  def self.user_interface
    new_calc = RPNCalculator.new
    string = ""
    input = gets.chomp
    until input == ""
      string += "#{input} "
      input = gets.chomp
    end
    puts new_calc.evaluate(string)
  end

  def self.file_format(line)
    new_calc = RPNCalculator.new
    new_calc.evaluate(line)
  end

end



if __FILE__ == $PROGRAM_NAME
  if ARGV.empty?
    RPNCalculator.user_interface
  else
    File.readlines(ARGV[0]).each do |line|
      line.chomp!
      puts RPNCalculator.file_format(line)
    end
  end
end
