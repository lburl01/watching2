require 'csv'
require_relative 'movie'
require_relative 'rating'

class MovieData
  def initialize(filename)
    @filename = filename
    @movies = {}
    @ratings = {}
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

end
