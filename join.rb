require 'json'
require 'securerandom'

require 'model/player'

def login(name)
	Player.new(name)
end

def join(player, game)
	player.join(game)
end

# terrible homebrew player database, to be replaced with something better later
$players = {}

def new_plid
	SecureRandom.uuid
end

get '/login/:name' do
	params[:name] or return 400  # die if no player name was specified

	begin
		player = login(params[:name])
	rescue
		return 403
	end

	plid = new_plid
	$players[plid] = player

	result = {:plid => plid}
	JSON.dump(result)
end

get '/join/:plid' do
	params[:plid] or return 400

	$g or return 403
	
	player = $players[params[:plid]]
	player or return 403

	id = join(player, $g)

	result = {:local_id => id}
	JSON.dump(result)
end