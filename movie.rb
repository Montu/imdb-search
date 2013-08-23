class Movie
	attr_accessor :name, :cast
	def initialize name, cast
		@name = name
		@cast = cast
	end

	def search_by_cast cast_name
		return true if @cast =~ Regexp.new(cast_name)
	end
end	