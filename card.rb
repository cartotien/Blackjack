# frozen_string_literal: true

class Card
  attr_reader :suit, :rank, :value

  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @value = value
  end

  def face
    suit + rank
  end
end
