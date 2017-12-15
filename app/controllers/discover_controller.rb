class DiscoverController < ApplicationController
  def show
    @tags = ActsAsTaggableOn::Tag.all
    @users= current_user.similar_raters

    if (params[:search_query].nil? || params[:search_query].empty?)
      @users= current_user.similar_raters
    else
        query=params.fetch(:search_query) || "*"
        name = User.search(params[:search_query], fields: [:first_name, :last_name, :display_name, :email])

        # tags= User.tagged_with(params[:tags], :any => true)
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
