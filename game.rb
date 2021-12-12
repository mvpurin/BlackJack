require './player.rb'
require './cards.rb'
require './game_desk.rb'

class Game
	attr_reader :user, :dealer

	def initialize(user, dealer)
		@user = user
		@dealer = dealer
	end

	def new_game
		@game_desk = GameDesk.new
		@game_bank = 0
		take_cards(@user)
		take_cards(@dealer)
		bet(@user)
		bet(@dealer)
	end

	def user_choice(arg)
		case arg
		when 1
			return
		when 2
			if @user.pack.cards.size < 3
				@user.pack.cards << @game_desk.choose_card
			else
				return
			end
		when 3
			return
		end
		p "user score is #{@user.pack.score}"
		p "user cards count is #{@user.pack.cards.size}"
	end

	def dealer_choice

		puts "Dealer is making his choice..."

		return if @dealer.pack.score >= 17 || @dealer.pack.cards.size > 2

		if @dealer.pack.score < 17 && @dealer.pack.cards.size < 3
			@dealer.pack.cards << @game_desk.choose_card
		end

		p "dealer score is #{@dealer.pack.score}"
		p "dealer cards count is #{@dealer.pack.cards.size}"
	end

	def result
		puts "Game result is..."

		if @user.pack.score > 21 && @dealer.pack.score > 21 || @user.pack.score == @dealer.pack.score
			puts "Nobody won!"
			@user.bank = @game_bank / 2
			@dealer.bank = @game_bank / 2
		end

		if (@user.pack.score > @dealer.pack.score && @user.pack.score < 22) || (@user.pack.score <= 21 && @dealer.pack.score > 21)
			puts "#{@user.name} won the game and got #{@game_bank} money!"
			@user.bank += @game_bank
		end

		if (@dealer.pack.score > @user.pack.score && @dealer.pack.score < 22) || (@dealer.pack.score <= 21 && @user.pack.score > 21)
			puts "#{@dealer.name} won the game and got #{@game_bank} money!"
			@dealer.bank += @game_bank
		end
	end

	def take_cards(player)
		player.pack.cards = []
		2.times {player.pack.cards << @game_desk.choose_card}
	end

	def bet(player)
		player.bank -= 10
		@game_bank += 10
	end
end