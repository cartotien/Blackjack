# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def initialize
    super('Dealer')
  end

  def make_move(deck)
    if card_value < 17
      take_card(deck)
      puts 'Dealer took card'
    else
      puts 'Dealer decided to pass'
    end
  end
end
