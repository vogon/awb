# request handlers
require 'join'
require 'newgame'
require 'nextpoint'
require 'play'
require 'status'

get '/' do
	File.read('./view.html')
end