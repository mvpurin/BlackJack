require './cards.rb'

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
		#p @desk
		@card = @desk.sample
		@desk.delete(@card)
		#p @card
	end

	def card_value
		@desk.each do |card|
			if !card.name.to_i.zero?
				card.value = card.name.to_i
			else 
				card.value = 10
			end
		end
	end
end