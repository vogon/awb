require 'json'

get '/nextpoint' do
	$g or return 403

	$g.next_point!

	result = 
		{
		 	:question => $g.current_point.question.text,
		 	:arity    => $g.current_point.question.arity,
		 	:card_czar => $g.current_point.card_czar
		}
	JSON.dump(result)
end