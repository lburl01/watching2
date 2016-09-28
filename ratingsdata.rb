require 'csv'
require_relative 'movie'
require_relative 'rating'

class RatingsData
  attr_reader :movies, :ratings

  def initialize(filename)
    @filename = filename
    @movies = {}
    @ratings = {}
    @values = []
  end

  def get_movie(input)
    return @movies[input] if @movies.length > 0

    CSV.foreach(@filename, encoding: 'windows-1252', col_sep: "|") do |line|
      id = line[0].to_i
      title = line[1]
      @movies[id] = Movie.new(id, title)
    end

    @movies[input]
  end

  def get_rating_by_movie(input) # should be a movie id number
    return @values if @ratings.length > 0
      CSV.foreach(@filename, encoding: 'windows-1252', col_sep: "\t") do |line|
        user_id = line[0].to_i
        movie_id = line[1].to_i
        score = line[2].to_i
        #@ratings[movie_id] = Rating.new(user_id, movie_id, score)
        if movie_id == input
          @values << Rating.new(user_id, movie_id, score)
          #@values << @ratings[movie_id]
        end
      end

    @values
  end

  def get_ratings_by_movie(input)
    # take a movie id supplied by user, in this case: input
    # go through the data file to find all instances of that movie id
    # take the user id associated with that instance of the movie id
    # AND take the rating associated with that user and movie id
    # push the user => rating into a hash where the key is movie id
    # return the hash of movie ids => {user => rating}
  end
end
