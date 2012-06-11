class Question
	def initialize(question)
	    if question.is_a? Hash
	  	    @guid = question[:guid]
		    @text = question[:question]
		    @arity = question[:arity]
		    fail ArgumentError.new("Need a question and arity keys in the question hash!") unless @text && @arity
	    else
	        fail TypeError.new("Questions should be a Hash!")
	    end
	end

	attr_reader :guid, :text, :arity
end
