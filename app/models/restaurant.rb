class Restaurant < ActiveRecord::Base
  has_many :reviews

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
