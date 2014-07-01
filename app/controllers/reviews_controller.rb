class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = @restaurant.reviews.create params[:review].permit(:thoughts, :rating)

    flash[:notice] = 'Review created!'
    redirect_to '/restaurants'
  end
end
