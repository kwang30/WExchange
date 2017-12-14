class DiscoverController < ApplicationController
  def show
    @tags = ActsAsTaggableOn::Tag.all
    if params[:search_query].nil?  && params[:tags].nil?
      @users = User.all
    else
        # query=params.fetch(:search_query) || "*"
        # name = User.search(params[:search_query], fields: [:first_name, :last_name, :full_name, :display_name, :email], suggest: true)
        # tags= User.tagged_with(params[:tags], :any => true)


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
