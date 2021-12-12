module Casino
	attr_reader :game_bank
	attr_accessor :money

	def game_bank
		@@game_bank ||= 0
	end

	def bank(money)
		game_bank
		@money = money
		@money -= 10
		@@game_bank += 10
	end
end