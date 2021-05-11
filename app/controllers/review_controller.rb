class ReviewController < ApplicationController
  def create
    @review = Review.new(review_params)
    @goat = Goat.find(params[:goat_id])
    @user = User.find(params[:user_id])
    @review.goat = @goat
    @review.user = @user

    @review.save
    redirect_to goat_path
  end

  private

  def review_params
    params.require(:review, :user_id, :goat_id).permit(:rating, :comment)
  end
end
