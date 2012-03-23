class Question
	def initialize(text, arity)
		@text = text
		@arity = arity
	end

	attr_reader :text, :arity
end