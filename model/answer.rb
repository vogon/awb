class Answer
	def initialize(answer)
		if answer.is_a? Hash then
			@guid = answer[:guid]
			@answer = answer[:answer]
		end

        def to_json_id
            { :guid => @guid }
        end

        def to_json_public
            { :guid => @guid, :text => @answer }
        end
	end

	attr_reader :guid, :answer
end