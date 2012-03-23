class Player
	def initialize(name)
		@name = name
		@hand = []
	end

	def join(game)
		game.join(self)
	end

	attr_accessor :name, :hand
end