class ReviewsController < ApplicationController
  # before_action :require_logged_in, only: [:create, :update]

  def index
    if review_params[:id]
      @reviews = User.find(params[:id]).reviews
    else
      @reviews = Review.all
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = current_user.reviews.create(review_params)
    @review.save!
		redirect_to current_user
  end

  def update
    # debugger
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_params)
      render :show
    else
      render json: @review.errors.messages, status: 422
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to current_user
  end

  private
  def review_params
    params.require(:review).permit(:text, :star, :user_id)
  end

end
