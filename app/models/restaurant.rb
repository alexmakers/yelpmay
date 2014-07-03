class Restaurant < ActiveRecord::Base
  validates :name, presence: true, format: {with: /\A[A-Z]/, message: 'has to start with a capital letter'}
  validates :cuisine, presence: true, length: {minimum: 3}
  has_many :reviews
  belongs_to :user

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
