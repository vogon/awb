class Player
	def initialize(name)
		@name = name
		@hand = []
	end

	def join(game)
		id = game.join(self)

		@game = game
		@id = id
	end

	def answer(anids)
		answers = []

		anids.each do |id|
			answers << hand[id]
		end

		# submit answers and get rid of the cards
		@game.current_point.answer[@id] = answers
		@hand -= answers
	end

	attr_accessor :name, :hand
	attr_reader :game
end