require_relative './spec_helper.rb'

describe Movie do
	let(:movie) {Movie.new("Hello", "Actor1,Actor2")}

	it "should create new movie" do
		movie.name.should == "Hello"
		movie.cast.should =~ /Actor1/
	end

	it "should return true if actor name matches cast" do
		movie.search_by_cast("Actor1").should be_true
	end

	it "should return false if actor name doesn't match cast" do
		movie.search_by_cast("Wrong User").should be_false
	end
end