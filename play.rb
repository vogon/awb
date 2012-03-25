require 'json'

def poetic_print(answers)
	(answers[1..-1]).inject(answers[0]) { |memo, s| memo + " / " + s }
end

def play(plid, anids)

end

get '/play/:plid/:anids' do
	$g or return 403
	params[:plid] or return 400
	params[:anids] or return 400

	plid = params[:plid].to_i
	anids = params[:anids].split(',').map { |id| id.to_i }

	player = $g.players[plid]

	answers = []
	anids.each do |id|
		answers << player.hand[id]
	end

	player.answer(anids)

	<<EOF
		<html>
		<body>
		You answered <i>#{$g.current_point.question.text}</i> with 
			<i>#{poetic_print(answers)}</i>.
		</body>
		</html>
EOF
end