class TowersOfHanoi
  
  attr_reader :pegs
  
  def initialize
    @pegs = [[3, 2, 1], [], []]
  end
  
  def render
    @pegs.each do |peg|
      peg.each do |disk|
        print "*" * disk
        print " "
      end
      puts
    end
  end
  
  def move(from, to)
    if pegs[to].empty?
      @pegs[to] << @pegs[from].pop
    else
      if @pegs[to].last < @pegs[from].last
        raise "can't put larger disk on smaller disk"
      end
      @pegs[to] << @pegs[from].pop
    end
  end
  
  def win?
    pegs.drop(1).any? {|peg| peg.length == 3}
  end
  
  def play
    until win?
      render
      get_move
    end
  end
  
  def get_move
    p "Input your start and end pegs, ex 1,3"
    new_move = gets.chomp.split(",").map(&:to_i)
    move(new_move.first, new_move.last)
  end

  #
end