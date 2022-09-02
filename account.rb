# frozen_string_literal: true

class Account
  attr_reader :bank, :player, :dealer

  def initialize
    @bank = 0
    @player = 100
    @dealer = 100
  end

  def players_broke?
    @player <= 0 || @dealer <= 0
  end

  def make_bets
    @player -= 10
    @dealer -= 10
    @bank += 20
  end

  def send_money(player)
    case player
    when 'dealer'
      @dealer += @bank
      @bank = 0
    when 'player'
      @player += @bank
      @bank = 0
    end
  end

  protected

  attr_writer :bank, :player, :dealer
end
