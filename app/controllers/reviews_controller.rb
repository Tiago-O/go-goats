class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @goat = Goat.find(params[:goat_id])
    @user = current_user
    @review.goat = @goat
    @review.user = @user

    if @review.save
      redirect_to @goat
    else
      render 'goats/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :goat_id)
  end
end
