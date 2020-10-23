class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G','PG','PG-13', 'R']
  end
  
  def self.ratings_to_show ratings
    ratings || all_ratings
  end
  
  def self.movies_to_show ratings_to_show
    puts ratings_to_show
    if ratings_to_show.kind_of?(Array)
      Movie.where(rating: ratings_to_show)
    else
      Movie.where(rating: ratings_to_show.keys)
    end
  end
end
