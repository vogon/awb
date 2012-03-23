require 'model/game'
require 'model/gameset'

get '/newgame/:n_players' do
	(params[:n_players] && params[:n_players].to_i >= 4) or return 400

	core_set = GameSet::load("./assets/core_1.2.yaml")

	$g = Game.new(params[:n_players].to_i, core_set)

	"new game created with #{params[:n_players]} players."
end