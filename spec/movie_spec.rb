require './movie.rb'

describe Movie do
	before(:each) do
		movie = Movie.new("Hello", "Actor1,Actor2")
	end

	it "should create new movie" do
		movie = Movie.new("Hello", "Actor1,Actor2")
		movie.name.should == "Hello"
		movie.cast.should =~ /Actor1/
	end

	it "should return true if actor name matches cast" do
		movie = Movie.new("Hello", "Actor1,Actor2")
		movie.search_by_cast("Actor1").should be_true
	end

	it "should return false if actor name doesn't match cast" do
		movie = Movie.new("Hello", "Actor1,Actor2")
		movie.search_by_cast("Wrong User").should be_false
	end
end