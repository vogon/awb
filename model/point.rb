require 'model/game'
require 'model/question'

class Point
	def initialize(game, question, card_czar, answerers)
		game.is_a? Game or raise "game must not be nil"
		question.is_a? Question or raise "question must not be nil"

		@game = game
		@question = question

		@answers = {}

		@card_czar = card_czar
		@answerers = answerers
	end

	def finished?
		(@answerers.reject { |player| @answers[player] }).length == 0
	end

	def answer!(player, answers)
		answers.is_a? Array or raise TypeError
		@answerers.index(player) or raise "that player doesn't exist!"

		if @answers[player] then 
			raise "no backsies!"
		elsif answers.length != self.question.arity then
			raise "wrong number of answers!"
		else
			@answers[player] = answers
		end

		nil
	end

	attr_reader :game, :question, :card_czar
end