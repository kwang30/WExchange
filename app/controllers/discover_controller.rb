class DiscoverController < ApplicationController
  def main
    @users = User.where("first_name like ?",  "%#{params[:q]}%")
  end

  def index
    render 'main'
  end

end
