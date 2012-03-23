require 'model/player'

get '/join/:name' do
	$g or return "no game is currently running."

	player = Player.new(params[:name])

	begin
		id = player.join($g)
	rescue
		return 403
	end

	"welcome to the game, #{params[:name]}!  you're player #{id}."
end