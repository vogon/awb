require 'json'

class AWB::API < Sinatra::Base
	post '/play' do
		$g or return 403
		params[:plid] or return 400
		params[:anids] or return 400

		plid = params[:plid].to_i
		anids = params[:anids].split(',').map { |id| id.to_i }

		player = $g.players[plid]

		answers = []
		anids.each do |id|
			answers << player.hand[id]
		end

		player.answer(anids)

		result =
			{

			}

		JSON.dump(result)
	end
end