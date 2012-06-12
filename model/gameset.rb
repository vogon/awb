require 'model/question'
require 'model/answer'

require 'yaml'

class GameSet
	def initialize(name, version, questions = [], answers = [])
		name or raise "bad name"
		version or raise "bad version"
		questions.is_a? Array or raise "bad questions"
		answers.is_a? Array or raise "bad answers"

		@questions = questions
		@answers = answers
	end

	def GameSet::load(path)
		begin
			yaml = YAML.load_file(path)

			if not yaml[:baked] then
				raise "this isn't a baked set"
			end

			name = yaml[:name]
			version = yaml[:version]

			questions = yaml[:questions].map{|q| Question.new(q)}
			answers = yaml[:answers].map{|a| Answer.new(a)}

			return GameSet.new(name, version, questions, answers)
		rescue
			nil
		end
	end

	def +(other)
		GameSet.new(questions + other.questions, answers + other.answers)
	end

	def valid?
		@questions.length > 0 and @answers.length > 0
	end

	attr_reader :questions, :answers
end
