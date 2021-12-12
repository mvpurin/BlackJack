# frozen_string_literal: true

require './cards.rb'

# This class describes a game desk with playing cards on it
class GameDesk
  attr_reader :desk

  def initialize
    @desk = []

    Cards::CARDS_NUMBER.each do |val1|
      Cards::CARDS_CLASS.each do |val2|
        @desk << Cards.new(val1, val2)
      end
    end
    card_value
  end

  def choose_card
    @card = @desk.sample
    @desk.delete(@card)
  end

  def card_value
    @desk.each do |card|
      card.value = if !card.name.to_i.zero?
                     card.name.to_i
                   else
                     10
                   end
    end
  end
end
