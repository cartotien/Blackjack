# frozen_string_literal: true

module GameLogic
  def self.included(base)
    base.include IO
    base.include Expressions
    base.include Actions
  end

  module IO
    def ask_name
      puts 'Enter your name: '
      gets.chomp.capitalize
    end

    def play_again
      puts 'Want to play again?'
      gets.chomp
    end

    def make_move
      puts 'What is your plan? Take, Pass or Show: '
      user_choice(gets.chomp)
    end

    def show_player_cards(player)
      puts "#{player.name}'s cards: "
      player.show_cards
      p player.card_value
    end
  end

  module Expressions
    def player_won
      ((@player.card_value > @dealer.card_value && !@player.over_21?) || (!@player.over_21? && @dealer.over_21?)) && !draw
    end

    def draw
      (@player.card_value == @dealer.card_value) || (@player.over_21? && @dealer.over_21?)
    end

    def broke_players?
      @player.broke? || @dealer.broke?
    end
  end

  module Actions
    def clear_players_cards
      [@dealer, @player].each { |player| player.cards.clear }
    end

    def generate_starting_hands
      [@dealer, @player].each do |player|
        2.times do
          player.take_card(@deck)
        end
      end
    end

    def make_bets
      [@dealer, @player].each { |player| @bank += player.take_bet }
    end

    def user_choice(choice)
      case choice.downcase
      when 'take'
        @player.take_card(@deck)
      when 'show'
        'show'
      end
    end

    def endgame_conditions
      if player_won
        puts "#{@player.name}, you won!"
        @winner = @player
      elsif draw
        puts 'Draw'
      else
        puts 'You lost'
        @winner = @dealer
      end
    end

    def money_to_winner
      return unless @winner

      @winner.bank += @bank
      @bank = 0
    end
  end
end
