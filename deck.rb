# frozen_string_literal: true

require_relative 'card'

class Deck
  SUITES = %w[♦ ♥ ♠ ♣].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze
  VALUES = [
    [11, 1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [10], [10], [10]
  ].freeze

  attr_reader :cards

  def initialize
    @cards = generate_deck
  end

  protected

  def generate_deck
    deck = []
    SUITES.each do |suit|
      RANKS.each_with_index do |rank, index|
        deck << Card.new(suit, rank,  VALUES[index])
      end
    end
    deck.shuffle
  end
end
