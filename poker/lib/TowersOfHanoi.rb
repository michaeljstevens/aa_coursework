class TowersOfHanoi
  attr_accessor :board
  def initialize
    @board = [[3,2,1], [], []]
  end

  def play
    until won?(board)
      p board
      begin
        puts "Starting stack?"
        start = gets.chomp.to_i
        puts "Destination stack?"
        dest = gets.chomp.to_i
        move([start, dest])
      rescue
        retry
      end

    end

    puts "Game over!"
  end

  def move(new_move)
    start = new_move[0]
    dest = new_move[1]
    unless board[dest].last.nil?
      if board[dest].last < board[start].last
        raise "Invalid move!"
      end
    end

    board[dest] << board[start].pop
  end

  def won?(board)
    return false unless board[0].empty?
    return true if board[1].empty? || board[2].empty?
    false
  end


end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play
end
