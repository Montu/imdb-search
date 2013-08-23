class MoviesList 
	def initialize
		@movies_list = []
	end

	def append movie
		@movies_list << movie
	end

	def search_by_cast cast_name
		@movies_list.each do |movie|
			return movie.name if movie.search_by_cast(cast_name)
		end
		return false
	end
end