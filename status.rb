require 'json'

def card_czar_markup(plid)
	if ($g.current_point.card_czar == plid) then
		"You're the card czar."
	else
		"#{$g.players[$g.current_point.card_czar].name} is the card czar."
	end
end

def hand_markup(plid)
	answer = $g.current_point.answer[plid]

	if ($g.current_point.card_czar == plid) then
		# say nothing; the card czar's hand isn't important.
	elsif (answer) then
		"You answered <i>#{answer}</i>."
	else
		status = "Your choices are:"

		$g.players[plid].hand.each do |answer|
			status << "<p>#{answer}</p>"
		end

		status
	end
end

get '/status' do
	if $g then
		JSON.dump({:n_games => 1, :games => {123 => "blah"}})
	else
		JSON.dump({:n_games => 0, :games => {}})
	end
end

get '/status/:plid' do
	$g or return 403
	params[:plid] or return 400

	plid = params[:plid].to_i
	((0...$g.n_players) === plid) or return 400

<<EOF
	<html>
	<body>
	This game has #{$g.n_players} players.<br/><br/>

	The question is:
	<blockquote>
		#{$g.current_point.question.text}
	</blockquote>

	#{card_czar_markup(plid)}

	#{hand_markup(plid)}

	</body>
	</html>
EOF
end