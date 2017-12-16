class DiscoverController < ApplicationController
  def show
    if (params[:search_query].nil? || params[:search_query].empty?)
     # @users= current_user.similar_raters
     # @users= User.all

    else
      
      search_condition = params[:search] || '*'

        # query=params[:search_query] || "*"
        # @users = User.search(params[:search_query], where: {
        #   :reviews
        #   }
        # )

        if !params[:review].nil?
        # reviews=params[:review].avg
        # users=[]
        # User.all.map do |user|
        #   if user.reviews.size==0
        #     users<<user
        #   end
        #
        #   puts user
          # review=Review.average(user.reviews)
          # puts review
        end
        puts @users.size

    end
    respond_to do |format|
      format.js
      format.html
   end
  end

  def index
    render 'main'
  end



end
