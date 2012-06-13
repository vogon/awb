require 'bundler'
Bundler.require
$LOAD_PATH << "."

require './main'
require './apimain'

map '/' do
    run AWB::Views.new
end

map '/api' do
    run AWB::API.new
end