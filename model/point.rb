class Point
	def initialize(game, question)
		game.is_a? Game or raise "game must not be nil"
		question.is_a? Question or raise "question must not be nil"

		@game = game
		@question = question

		@answers = [nil] * game.n_players
	end

	def answer
		Answers.new(self, @answers)
	end

	def question
		@question
	end

	private
	class Answers
		def initialize(pt, value)
			@point = pt
			@value = value
		end

		def [](idx)
			@value[idx]
		end

		def []=(idx, answer)
			answer.is_a? Array or raise "answer is wrong type"

			if @value[idx] then
				raise "no backsies!"
			elsif @value[idx].length != pt.question.arity then
				raise "wrong number of answers"
			else
				@value[idx] = answer
			end		
		end
	end

end