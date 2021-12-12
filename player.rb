require './pack.rb'

class Player
	attr_accessor :name, :pack, :bank

	def initialize(name)
		@name = name
		@pack = Pack.new
		@bank = 100
	end
end

class UserPlayer < Player
	def initialize(name)
		super(name)
	end
end

class Dealer < Player
	def initialize
		super("Dealer")
	end
end