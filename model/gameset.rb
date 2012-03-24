require 'model/question'

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

			name = yaml[:name]
			version = yaml[:version]

			questions = []

			yaml[:questions].each do |q|
				case
				when (q.is_a? String) then
					questions << Question.new(q, 1)
				when (q.is_a? Hash) then
					questions << Question.new(q[:question], q[:arity])
				else raise "unrecognized question format"
				end
			end

			answers = []

			yaml[:answers].each do |a|
				answers << a
			end

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
