require_relative 'moviedata'
require_relative 'ratingsdata'

class Rating
  attr_accessor :user_id, :movie_id, :score

  def initialize(user_id, movie_id, score)
    @user_id = user_id
    @movie_id = movie_id
    @score = score
  end

end
