class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review)
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:id])
    @review.save
    redirect_to prep_path(@review.prep)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
