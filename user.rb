require_relative 'moviedata'
require_relative 'rating'
require_relative 'ratingsdata'
require_relative 'movie'

class User
  attr_accessor :id, :ratings

  def initialize(id)
    @id = id
    @ratings = {} # movie_id => score
  end

end
