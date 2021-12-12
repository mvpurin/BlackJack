# frozen_string_literal: true

# This class describes cards wich player and dealer have
class Pack
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def score
    @score = 0
    @cards.each do |card|
      ace?(card)
      @score += card.value
    end
    ace_change_value?(@score)
    @score
  end

  def ace?(card)
    card.value = 1 if card.name == 'Ace'
  end

  def ace_change_value?(_score)
    cards.each do |card|
      if card.name == 'Ace' && @score.to_i + 10 < 22
        card.value = 11
        @score = @score.to_i - 1 + card.value
      end
    end
  end
end
