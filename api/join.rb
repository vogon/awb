require 'json'
require 'securerandom'

require 'model/player'

def login(name)
	plid = SecureRandom.uuid

	Player.new(name, plid)
end

def join(player, game)
	player.join(game)
end

# terrible homebrew player database, to be replaced with something better later
$players = {}

class AWB::API < Sinatra::Base
	post '/login' do
		params[:name] or return 400  # die if no player name was specified

		begin
			player = login(params[:name])
		rescue
			return 403
		end

		$players[player.plid] = player

		result = {:status => "ok", :plid => player.plid}
		return JSON.dump(result)
	end

	post '/join' do
		params[:plid] or return 400

		$g or return 403
		
		player = $players[params[:plid]]
		player or return 403

		id = join(player, $g)

		result = {:status => "ok"}
		JSON.dump(result)
	end
end