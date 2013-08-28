require 'nokogiri'
require 'open-uri'
require './movie.rb'
require './movies_list.rb'
class Imdb
  attr_reader :movies_list
  BASE_IMDB_ADDR = "http://www.imdb.com"  
	def initialize max_enteries
		@max_enteries = max_enteries + 1
		@movies_list = MoviesList.new
	end	

	def generate_db
    im_website = Nokogiri::HTML open (BASE_IMDB_ADDR + "/chart/top")
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

  def search_movie_by_cast cast_name
    movie_list_stringfiedreturn_value = ""
  	movies_found = @movies_list.search_by_cast cast_name
    if movies_found.empty?
      return_value = "No match found"
    else
      stringify movies_found
    end
  end

  private

  def stringify any_list
    any_list.inject(""){|gross,ele| "#{gross} | #{ele}"}
  end 
end






