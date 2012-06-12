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
			a = hand.detect { |answer| answer.guid == guid } 
			a or raise "you don't have that card"
			answers << a
		end

		# submit answers and get rid of the cards
		@game.current_point.answer!(self, answers)
		@hand -= answers
	end

	attr_accessor :name, :hand
	attr_reader :game
end