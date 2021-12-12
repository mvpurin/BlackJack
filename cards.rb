#This class has information about names, suits and values of cards
class Cards
	CARDS_NUMBER = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
	CARDS_CLASS = %w(+ <> <3 ^).freeze

	attr_reader :name, :suit
	attr_accessor :value

	def initialize(name, suit, value=nil)
		@name = name
		@suit = suit
		@value = value
	end
end