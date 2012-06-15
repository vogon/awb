require 'json'

class AWB::API < Sinatra::Base
    post '/nextpoint' do
    	$g or return 403

    	$g.next_point!

    	result = 
    		{
    		 	:question => $g.current_point.question.to_json_public,
    		 	:card_czar => $g.current_point.card_czar.to_json_id
    		}
    	JSON.dump(result)
    end
end