class DiscoverController < ApplicationController
  def main
    if params[:q].nil?
      @users = Array.new
    else
      @users = User.where("first_name like ?",  "%#{params[:q]}%")
    end
  end

  def index
    render 'main'
  end

end
