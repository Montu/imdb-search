require_relative './spec_helper.rb'

describe MoviesList do
	# before :each do
	# 	movie = Movie.new "Some Movie Name", "Akshay Bhardwaj,Some Bhardwaj"
	# 	movies_list = MoviesList.new 
	# 	movies_list.append movie
	# end	

	describe "Valid data test" do
		movie = Movie.new "Some Movie Name", "Akshay Bhardwaj,Some Bhardwaj"
		movies_list = MoviesList.new 
		movies_list.append movie
		it "should print movie name once actor/actress name found" do
			movies_list.search_by_cast("Akshay Bhardwaj").should_not be_empty
			#STDOUT.should_receive(:puts).with "Some Movie Name"
		end
	end

	describe "Invalid data test" do
		movie = Movie.new "Some Movie Name", "Akshay Bhardwaj,Some Bhardwaj"
		movies_list = MoviesList.new 
		movies_list.append movie
		it "should print 'Not Found' if actor/actresss name not found" do
			movies_list.search_by_cast("Wrong Actor").should be_empty
			#STDOUT.should_receive(:puts).with "Not Found!"
		end
	end
end
