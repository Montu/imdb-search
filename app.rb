require './imdb.rb'
if ARGV.empty?
  puts "Please supply maximum_number_of_elements along with script as an argument! Usage: ruby imdb_search.rb [maxiumun_number_of_elements]"
  exit 1
end

imdb = Imdb.new ARGV[0].to_i
puts "Started database generation"
imdb.generate_db
puts "Finished database generation"
puts "Repl started: Enter name of person to search or enter end to terminate repl .."
while true  do
  print("> ")
  repl_input = $stdin.gets.chomp
  case repl_input
    when "end"
      break
    else
      puts "Movie(s) have this person in cast are: "
      puts imdb.search_movie_by_cast repl_input   
      puts "Movie(s) search ended" 
  end
end