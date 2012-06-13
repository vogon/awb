# request handlers
require 'sinatra'
require 'mustache'
require 'mustache/sinatra'

module AWB
end

class AWB::Views < Sinatra::Base
    register Mustache::Sinatra

    get '/' do
    	redirect '/main.html', 303
    end

    set :mustache, {
        :templates => "./templates",
        :views => "./views"
    }

    get '/test' do
        mustache :test
    end
end

Sinatra.register Mustache::Sinatra