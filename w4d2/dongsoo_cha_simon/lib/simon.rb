class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    input = gets.chomp
    game_over = true if input.split != @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "Good Job! Next Round is coming!"
  end

  def game_over_message
    p "Game over! Have fun in this infinite loop ;)"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
