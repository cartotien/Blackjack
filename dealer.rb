# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  STOP_VALUE = 17

  def initialize
    super('Dealer')
  end

  def make_move(deck)
    if card_value < STOP_VALUE
      take_card(deck)
      puts 'Dealer took card'
    else
      puts 'Dealer decided to pass'
    end
  end
end
