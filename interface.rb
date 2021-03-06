# frozen_string_literal: true

require './player.rb'
require './game.rb'

# This is a main class which has an iteration cycles
class Interface
  def initialize
    puts 'Welcome to the Game!'
    puts 'Enter your name: '
    name = gets.chomp
    @game = Game.new(UserPlayer.new(name), Dealer.new)

    loop do
      puts "\nPress 1 to start the game: "
      puts "Press 0 to exit: "
      answer = gets.chomp.to_i
      break if answer.zero?

      case answer
      when 1
        start
      end
    end
  end

  def start
    @game.new_game
    loop do
      puts "\nPlayer cards are: "
      @game.user.pack.cards.each do |card|
        puts "#{card.name}#{card.suit}  #{card.value}"
      end
      puts "score: #{@game.user.pack.score}\n\n"

      puts 'Press 1 to skip your turn: ' if @game.step < 2
      puts 'Press 2 to take a card: ' if @game.user.pack.cards.size < 3
      puts 'Press 3 to open cards: '

      choice = gets.chomp.to_i

      @game.user_choice(choice)

      break if choice == 3 || (@game.user.pack.cards.size > 2\
       && @game.dealer.pack.cards.size > 2)

      @game.dealer_choice
    end
    puts @game.result
  end
end
