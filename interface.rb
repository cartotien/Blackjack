# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require_relative 'game_logic'

class Interface
  include GameLogic

  def initialize
    @dealer = Dealer.new
    @player = Player.new(ask_name)
    @bank = 0
    @winner = nil
    start_game
  end

  STOP_WORDS = %w[stop no exit].freeze

  protected

  def start_game
    loop do
      break if STOP_WORDS.include?(new_game.downcase) || broke_players?
    end
  end

  def new_game
    clear_players_cards
    @deck = Deck.generate_deck
    generate_starting_hands
    make_bets
    show_player_cards(@player)
    @dealer.make_move(@deck)
    make_move
    endgame
    play_again
  end

  def endgame
    show_player_cards(@player)
    show_player_cards(@dealer)
    endgame_conditions
    money_to_winner
  end
end
