require 'bundler'
Bundler.require
$LOAD_PATH << "."
require 'main.rb'
run Sinatra::Application