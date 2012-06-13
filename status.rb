require 'json'

class AWB::API < Sinatra::Base
	get '/status' do
		if $g then
			JSON.dump({:n_games => 1, :games => {123 => "blah"}})
		else
			JSON.dump({:n_games => 0, :games => {}})
		end
	end

	get '/status/:plid' do
		$g or return 403
		params[:plid] or return 400

		plid = params[:plid].to_i
		((0...$g.n_players) === plid) or return 400

		result =
			{
				:n => $g.n_players,
				:question => $g.current_point.question.text,
				:card_czar => nil,
				:answered => nil,
				:hand => nil
			}

		JSON.dump(result)
	end
end