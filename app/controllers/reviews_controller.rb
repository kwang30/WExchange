class ReviewsController < ApplicationController
  before_action :require_logged_in, only: [:create, :update]

  def index
    if review_params[:id]
      @reviews = Review.where(room_id: review_params["room_id"]).order(created_at: :desc)
    else
      @reviews = Review.all
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)

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
    render :show
  end

  private
  def review_params
    params.require(:review).permit(:consumer_id, :customer_id, :rating, :body)
  end

end
