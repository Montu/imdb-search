require_relative './spec_helper.rb'

describe Imdb do 
	let(:imdb) {Imdb.new 2}
	it "should generate database" do
		imdb.generate_db
		imdb.movies_list.movies_list.length.should == 2
	end

	describe "should search for cast" do
		before :each do
			imdb.generate_db
		end

		it "should return movie(s) list when cast found" do
			imdb.search_movie_by_cast("Tim").should =~ /Shawshank Redemption/
		end

		it "should return empty list when cast not found" do
			imdb.search_movie_by_cast("Wrong User").should == "No match found"
		end
	end
end