require_relative 'moviedata'
require_relative 'rating'

class Movie
  attr_accessor :id, :title, :rating

  def initialize(id, title)
    @id = id
    @title = title
    @ratings = []
  end

end
