class MyStack

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(value)
    @store << value
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end
