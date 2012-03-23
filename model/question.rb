class Question
	def initialize(question)
	  if question.is_a? String
		  @text = question
		  @arity = 1
		elsif question.is_a? Hash
		  @text = question[:question]
		  @arity = question[:arity]
		  fail ArgumentError.new("Need a question and arity keys in the question hash!") unless @text && @arity
	  else
	    fail TypeError.new("Questions should be a String or Hash!")
	  end
	end

	attr_reader :text, :arity
end
