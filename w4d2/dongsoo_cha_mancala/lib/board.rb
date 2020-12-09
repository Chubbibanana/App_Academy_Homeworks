require 'byebug'
require_relative 'player'
class Board
  attr_accessor :cups, :name1, :name2, :side1, :side2

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    @cups.map!.with_index {|ele, i| i != 6 && i != 13 ? [:stone, :stone, :stone, :stone] : ele}
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 14 || start_pos < 0
    raise 'Starting cup is empty' if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    count = @cups[start_pos].length if valid_move?(start_pos)
    @cups[start_pos] = [] # empty cup
    idx = start_pos
    if current_player_name == @name1
      while count > 0
        idx = (idx + 1) % 14
        next if idx == 13
        @cups[idx] << :stone
        count -= 1
      end
    else
      while count > 0
        idx = (idx + 1) % 14
        next if idx == 6  
        @cups[idx] << :stone
        count -= 1
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].count(:stone) == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return false if !@cups[0..5].flatten.empty? && !cups[7..12].flatten.empty?
    true
  end

  def winner
    if @cups[6].count > @cups[13].count 
      return @name1 
    elsif @cups[6].count < @cups[13].count 
      return @name2
    else
      return :draw
    end
  end
end
