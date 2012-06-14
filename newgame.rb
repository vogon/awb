require 'json'

require 'model/game'
require 'model/gameset'

def new_game(n_players)
	if (n_players < 4) then 
		raise ArgumentError.new "not enough players"
	end

	core_set = GameSet::load('./assets/core_1.2.set')

	$g = Game.new(n_players, core_set)
end

class AWB::API < Sinatra::Base
	post '/newgame' do
		# die with a 400 if no player count was specified
		params[:n_players] or return 400

		begin
			new_game(params[:n_players].to_i)

			result = {}

			JSON.dump(result)
		rescue ArgumentError
			return 400
		end
	end
end