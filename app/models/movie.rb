class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G','PG','PG-13', 'R']
  end
  
  def self.ratings_to_show ratings
    ratings || all_ratings
  end
  
  def self.movies_to_show ratings_to_show, order_by
    puts ratings_to_show
    if ratings_to_show.kind_of?(Array)
      if order_by.nil?
        Movie.where(rating: ratings_to_show)
      elsif order_by.eql? 'title'
        Movie.where(rating: ratings_to_show).order(title: :asc)
      elsif order_by.eql? 'release'
        Movie.where(rating: ratings_to_show).order(release_date: :desc)
      end
    else
      if order_by.nil?
        Movie.where(rating: ratings_to_show.keys)
      elsif order_by.eql? 'title'
        Movie.where(rating: ratings_to_show.keys).order(title: :asc)
      elsif order_by.eql? 'release'
        Movie.where(rating: ratings_to_show.keys).order(release_date: :desc)
      end
    end
  end
end
