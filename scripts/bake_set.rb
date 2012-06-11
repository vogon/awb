require 'securerandom'
require 'yaml'

# load unbaked yaml
set = YAML.load_file(ARGV[0])

baked_set = set.clone
baked_set[:questions] = []
baked_set[:answers] = []

set[:questions].each do |q|
	if q.is_a? String then
		baked_set[:questions] << { :guid => SecureRandom.uuid, :question => q, :arity => 1 }
	else
		baked_set[:questions] << { :guid => SecureRandom.uuid, :question => q[:question], :arity => q[:arity] }
	end
end

set[:answers].each do |a|
	if a.is_a? String then
		baked_set[:answers] << { :guid => SecureRandom.uuid, :answer => a }
	else
		baked_set[:answers] << a
	end
end

baked_set[:baked] = true

# spit it back out
ARGV[0] =~ /\.yaml/
io = File.open($` + ".set", "w")
YAML.dump(baked_set, io)