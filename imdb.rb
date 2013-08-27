require 'nokogiri'
require 'open-uri'
require './movie.rb'
require './movies_list.rb'
class Imdb
	BASE_IMDB_ADDR = "http://www.imdb.com"

	def initialize max_enteries
		@max_enteries = max_enteries + 1
		@movies_list = MoviesList.new
		@db_title = []
		@db_casts = []
	end	

	def generate_db
		puts "Started database generation"
	    im_website = Nokogiri::HTML open (BASE_IMDB_ADDR + "/chart/top")
	    puts BASE_IMDB_ADDR + "/chart/top"
	    im_website.css("div#main table a")[2..@max_enteries].each do |element|
	    	#@db_title << element.text
      	#@db_casts << get_casts(element['href'])
      	new_movie = Movie.new(element.text, get_casts(element['href']))
      	@movies_list.append new_movie
      end
    end
    puts "Finished database generation"

    def get_casts var_addr
    # puts "Finding for #{BASE_IMDB_ADDR + var_addr}"
    cast_website = Nokogiri::HTML open (BASE_IMDB_ADDR + var_addr)

    casts_string = ""
    cast_website.css("div#titleCast a span").each do |cast|
      casts_string += " #{cast.text}"
    end
    casts_string
  end

  def show_db_title
    @db_title.each {|title| puts title}
  end

  def show_db_casts
    @db_casts.each {|cast| puts cast}
  end

  def search_movie_by_cast cast_name
    puts "Started Search for movies by #{cast_name}"
    match_indices = @db_casts.each_index.select{|i| @db_casts[i] =~ Regexp.new(cast_name)}
    puts "Movie(s) having this person in cast: "
    match_indices.each do |index|
      puts @db_title[index]
    end
    puts "Ended Search for movies by #{cast_name}"
  end

  def search_movie_by_cast_modular cast_name
  	puts "Started Search for movies by #{cast_name}"
  	movie_found = @movies_list.search_by_cast cast_name
    if movie_found
  	puts "Movie(s) having this person in cast: "
  	puts movie_found.title
  end
end

if ARGV.empty?
  puts "Please supply maximum_number_of_elements along with script as an argument! Usage: ruby imdb_search.rb [maxiumun_number_of_elements]"
  exit 1
end

imdb = Imdb.new ARGV[0].to_i
imdb.generate_db
puts "Repl started: Enter name of person to search or enter end to terminate repl .."
while true  do
  print("> ")
  repl_input = $stdin.gets.chomp
  case repl_input
    when "end"
    break
    else
    imdb.search_movie_by_cast_modular repl_input    
  end
end




