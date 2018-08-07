class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review)
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @prep = Prep.find(params[:prep_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.prep = Prep.find(params[:prep_id])
    @review.user = current_user
    authorize @review
    @review.save
    redirect_to prep_path(@review.prep)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
