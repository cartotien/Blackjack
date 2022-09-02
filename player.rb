# frozen_string_literal: true

class Player
  attr_accessor :bank, :cards
  attr_reader :name

  MAX_HAND_VALUE = 21

  def initialize(name)
    @name = name
    @cards = []
  end

  def card_value
    @total_value = 0
    @cards.map(&:value).each do |card_value|
      @total_value += @total_value < MAX_HAND_VALUE ? card_value.max : card_value.min
    end
    @total_value
  end

  def show_cards
    @cards.each { |card| p card.face }
  end

  def take_card(deck)
    @cards << deck.pop
    @cards.flatten!
  end

  def over_21?
    card_value > MAX_HAND_VALUE
  end
end
