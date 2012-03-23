$LOAD_PATH << "."

require 'model/point'
require 'model/question'
require 'model/game'
require 'model/gameset'

require 'sinatra'

get '/' do 
	core_set = GameSet::load("./assets/core_1.2.yaml")

	g = Game.new(4, core_set)

	hand = []
	10.times { hand << g.draw_answer! }

	first_question = g.draw_question!

	<<EOF
		Here's your starting hand: #{hand}

		and here's the first question: #{first_question.text}
EOF
end