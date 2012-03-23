class Game
	def initialize(n_players, set)
		n_players > 0 and n_players.is_a? Fixnum or raise "n_players bad"
		set.is_a? GameSet and set.valid? or raise "set bad"

		@n_players = n_players
		@questions = set.questions.shuffle
		@answers = set.answers.shuffle
	end

	def draw_question!
		@questions.pop
	end

	def draw_answer!
		@answers.pop
	end

	attr_reader :n_players
end