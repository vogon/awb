class Answer
	def initialize(answer)
		if answer.is_a? Hash then
			@guid = answer[:guid]
			@answer = answer[:answer]
		end
	end

	attr_reader :guid, :answer
end