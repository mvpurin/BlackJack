# frozen_string_literal: true

require './pack.rb'

# This is a common class for palyer and dealer
class Player
  attr_accessor :name, :pack, :bank

  def initialize(name)
    @name = name
    @pack = Pack.new
    @bank = 100
  end
end

# This is a subclass for player
class UserPlayer < Player
  def initialize(name)
    super(name)
  end
end

# This is a subclass for dealer
class Dealer < Player
  def initialize
    super('Dealer')
  end
end
