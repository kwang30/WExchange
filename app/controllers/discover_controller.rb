class DiscoverController < ApplicationController
  def show
    @tags = ActsAsTaggableOn::Tag.all
    if params[:search_query].nil? && params[:tags].nil?
      # @users = User.all
    else
        query=params.fetch(:search_query) || "*"
        # @users = User.search(params[:search_query], fields: ["first_name"], suggest: true)
        @users=User.tagged_with(params[:tag_name], :any => true)

        # @users=User.tagged_with(params[:tag_name], :any => true)
        puts params[:tag_name]
        puts "LOL"
        puts @users.size

       # @users1 = User.search(params[:tags], fields: [:tag])


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
