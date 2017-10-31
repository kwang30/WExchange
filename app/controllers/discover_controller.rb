class DiscoverController < ApplicationController
  def show
    if params[:search_query].nil?
      @users = User.all
    else
      @users = User.where("first_name like ?",  "%#{params[:search_query]}%")
    end
  end

  def index
    render 'main'
  end

end
