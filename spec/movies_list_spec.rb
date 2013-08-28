require_relative './spec_helper.rb'

describe "MoviesList" do
	
	let(:movie) { Movie.new "Some Movie Name", "Akshay Bhardwaj,Some Bhardwaj"}
	let(:movies_list) {MoviesList.new}
	before :each do
		movies_list.append movie		
	end

	describe "Valid data test" do
		it "should print movie name once actor/actress name found" do
			movies_list.search_by_cast("Akshay Bhardwaj").should_not be_empty
		end
	end

	describe "Invalid data test" do
		it "should print 'Not Found' if actor/actresss name not found" do
			movies_list.search_by_cast("Wrong Actor").should be_empty
		end
	end
end
