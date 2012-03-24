require 'model/player'

def login(name)
	Player.new(name)
end

def join(player, game)
	player.join(game)
end

get '/join/:name' do
	$g or return 403             # die if no game is running
	params[:name] or return 400  # die if no player name was specified

	begin
		player = login(params[:name])
	rescue
		return 403
	end

	id = join(player, $g)

	"welcome to the game, #{params[:name]}!  you're player #{id}."
end