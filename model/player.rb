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

	def answer(guids)
		answers = []

		guids.each do |guid|
			answers << hand.detect({ raise "you don't have that card" }) do |answer|
				answer.guid == guid
			end
		end

		# submit answers and get rid of the cards
		@game.current_point.answers[self] = answers
		@hand -= answers
	end

	attr_accessor :name, :hand
	attr_reader :game
end