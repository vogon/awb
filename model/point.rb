require 'model/game'
require 'model/question'

class Point
	def initialize(game, question, card_czar)
		game.is_a? Game or raise "game must not be nil"
		question.is_a? Question or raise "question must not be nil"

		@game = game
		@question = question

		@answers = [nil] * game.n_players
		@card_czar = card_czar
	end

	def finished?
		(0...game.n_players).all? do |i|
			(card_czar == i) || @answers[i]
		end
	end

	def answer
		Answers.new(self, @answers)
	end

	attr_reader :game, :question, :card_czar

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
			(0...@point.game.n_players) === idx or 
				raise "that player doesn't exist!"
			idx != @point.card_czar or raise "the card czar can't answer!"

			if @value[idx] then
				raise "no backsies!"
			elsif answer.length != @point.question.arity then
				raise "wrong number of answers"
			else
				@value[idx] = answer
			end		
		end
	end
end