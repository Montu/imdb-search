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
    im_website = Nokogiri::HTML open (BASE_IMDB_ADDR + "/chart/top")
    puts BASE_IMDB_ADDR + "/chart/top"
    im_website.css("div#main table a")[2..@max_enteries].each do |element|
    	new_movie = Movie.new(element.text, get_casts(element['href']))
    	@movies_list.append new_movie
    end
  end
  
  def get_casts var_addr
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
  	movies_found = @movies_list.search_by_cast cast_name
    if movies_found.empty?
      puts "No match found"
    else
      movies_found.each do |movie_name|
        puts movie_name  
      end
    end
  end
end






