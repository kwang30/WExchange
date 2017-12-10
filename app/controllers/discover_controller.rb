class DiscoverController < ApplicationController
  def show
    if params[:search_query].nil? && params[:tags].nil?
      @users = User.all
    else
      # query = SearchkickQuery.new(keywords: keywords, offset: 0, limit: 25)
      # query.body[:query] =  { match: {name: "Tex-Mex"} }
      query=params.fetch(:search_query) || "*"

       @users = User.search(params[:search_query], fields: ["first_name"])
       # if @users.nil? || @users.size==0
       #   @users = User.all
       # end

    end
  end

  def index
    render 'main'
  end

  


  # def recommend
  #   tags=current_user
  #   list=[]
  #   current_user.portfolios.each do |portfolio|
  #     portfolio.tags.each do |tag|
  #       list<< tag
  #     end
  #   end
  #   @users=User.tagged_with(tags) && User.tagged_with(list)
  # end



end
