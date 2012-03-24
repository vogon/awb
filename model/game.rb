require 'model/gameset'
require 'model/point'

class Game
	def initialize(n_players, set)
		((n_players > 0) && (n_players.is_a? Fixnum)) or raise "n_players bad"
		((set.is_a? GameSet) && set.valid?) or raise "set bad"

		@n_players = n_players

		@players = [nil] * n_players
		@card_czar = Random.new.rand 0...n_players

		@questions = set.questions.shuffle
		@answers = set.answers.shuffle
	end

	def join(player)
		# find first empty player slot
		slot = next_empty_slot
		slot or raise "no slots left"

		# put the player in that slot, return player id
		@players[slot] = player
		slot
	end

	def next_point!
		if players.any? { |p| !p } then
			raise "game isn't full yet"
		end

		if @current_point && !(@current_point.finished?) then
			raise "hold on, we're still finishing the last one"
		end

		@current_point = Point.new(self, draw_question!, @card_czar)
		@card_czar = (@card_czar + 1) % @n_players

		# have each player draw up to 10 cards.
		@players.each do |player|
			(10 - player.hand.length).times { player.hand << draw_answer! }
		end
	end

	def draw_question!
		@questions.pop
	end

	def draw_answer!
		@answers.pop
	end

	attr_reader :n_players, :current_point
	attr_reader :players

	private
	def next_empty_slot
		@players.index(nil)
	end
end