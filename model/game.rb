class Game
	def initialize(n_players, set)
		n_players > 0 and n_players.is_a? Fixnum or raise "n_players bad"
		set.is_a? GameSet and set.valid? or raise "set bad"

		@n_players = n_players
		@players = [nil] * n_players

		@questions = set.questions.shuffle
		@answers = set.answers.shuffle

		@card_czar = Random.new.rand 0...n_players
	end

	def join(player)
		# find first empty player slot
		next_slot = @players.index(nil)
		next_slot or raise "no slots left"

		# put the player in that slot, and give them some answer cards
		@players[next_slot] = player
		10.times { player.hand << draw_answer! }

		# return player id
		next_slot
	end

	def next_point!
		@current_point = Point.new(self, draw_question!, @card_czar)
		@card_czar = (@card_czar + 1) % @n_players
	end

	def draw_question!
		@questions.pop
	end

	def draw_answer!
		@answers.pop
	end

	attr_reader :n_players, :current_point
end