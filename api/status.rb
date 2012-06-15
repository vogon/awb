require 'json'

class AWB::API < Sinatra::Base
	get '/games' do
		if $g then
			JSON.dump({:n_games => 1, :games => {123 => "blah"}})
		else
			JSON.dump({:n_games => 0, :games => {}})
		end
	end

	get '/status' do
		$g or return 403
		params[:plid] or return 400

		plid = params[:plid]

		player_index = $g.players.index { |player| player.plid == plid }
		player_index or return 400

		player = $g.players[player_index]

		result =
			{
				:n => $g.n_players,
				:question => $g.current_point.question.to_json_public,
				:card_czar => $g.current_point.card_czar.to_json_id,
				:answered => nil,
				:hand => player.hand.map { |card| card.to_json_public }
			}

		JSON.dump(result)
	end
end