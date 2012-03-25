# request handlers
require 'join'
require 'newgame'
require 'nextpoint'
require 'play'
require 'status'

get '/' do
	redirect '/main.html', 303
end