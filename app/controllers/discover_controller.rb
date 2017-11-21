class DiscoverController < ApplicationController
  def show
    if params[:search_query].nil? && params[:tags].nil?
      @users = User.all
    else
      @users = User.where("first_name like ?",  "%#{params[:search_query]}%")
      @users=User.tagged_with(params[:tags])
    end
  end



  def index
    render 'main'
  end

  def recommend
    tags=current_user
    list=[]

    current_user.portfolios.each do |portfolio|
      portfolio.tags.each do |tag|
        list<< tag
      end
    end
    @users=User.tagged_with(tags) && User.tagged_with(list)

  end

end
