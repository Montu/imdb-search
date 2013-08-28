class MoviesList
	attr_reader :movies_list
	def initialize
		@movies_list = []
	end

	def append movie
		@movies_list << movie
	end

	def search_by_cast cast_name
		result_of_cast_search = []
		@movies_list.each do |movie|
			result_of_cast_search << movie.name if movie.search_by_cast(cast_name)
		end
		return result_of_cast_search
	end
end