get '/nextpoint' do
	$g or return 403

	$g.next_point!

	"started a new point"
end