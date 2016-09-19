require_relative 'my_stack'
require 'byebug'
class StackQueue

  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
    @max_stack = MyStack.new
    @min_stack = MyStack.new
    @current_max = nil
    @current_min = nil
  end

  def enqueue(value)
    check_max(value)
    check_min(value)
    @stack1.push(@stack2.pop) until @stack2.empty?
    @stack1.push(value)
  end

  def dequeue
    @stack2.push(@stack1.pop) until @stack1.empty?
    value = @stack2.pop
    if @current_max == value
      @max_stack.pop
      @current_max = @max_stack.peek
    end
    if @current_min == value
      @min_stack.pop
      @current_min = @min_stack.peek
    end
  end

  def peek
    if @stack1.empty?
      @stack2.peek
    else
      @stack1.peek
    end
  end

  def size
    if @stack1.empty?
      @stack2.size
    else
      @stack1.size
    end
  end

  def empty?
    if @stack1.empty?
      @stack2.empty?
    else
      @stack1.empty?
    end
  end

  def check_max(value)
    if @current_max.nil? || value > @current_max
      @current_max = value
      @max_stack.push(value)
    end
  end

  def check_min(value)
    if @current_min.nil? || value < @current_min
      @current_min = value
      @min_stack.push(value)
    end
  end

  def max
    @current_max
  end

  def min
    @current_min
  end

end
