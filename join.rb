require 'model/player'

get '/join/:name' do
	$g or return 403             # die if no game is running
	params[:name] or return 400  # die if no player name was specified

	player = Player.new(params[:name])

	begin
		id = player.join($g)
	rescue
		return 403
	end

	"welcome to the game, #{params[:name]}!  you're player #{id}."
end