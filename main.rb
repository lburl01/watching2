require_relative 'moviedata'
require_relative 'rating'
require_relative 'movie'
require_relative 'ratingsdata'

def get_input
  print " > "
  input = gets.chomp.to_i
end

def main
  movies_database = MovieData.new('./ml-100k/u.item')
  ratings_database = RatingsData.new('./ml-100k/u.data')

  puts "Enter a movie id number to get the movie title "
  input = get_input
  movie = movies_database.get_movie(input)
  puts movie.title

  puts "Enter a movie id number to see all users who have rated that movie along with their rating."
  input = get_input
  movie_ratings = ratings_database.get_rating_by_movie(input)
  movie = movies_database.get_movie(input)
  puts "The movie #{movie.title} has been rated by #{movie_ratings.count} users and their ratings are #{movie_ratings}."

end

if __FILE__ == $PROGRAM_NAME
  main
end
