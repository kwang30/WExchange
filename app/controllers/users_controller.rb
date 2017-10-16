class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
      @user = User.find(params[:id])
  end

  def index
  end

	def profile
	end

	def edit
    @user = User.new
	end

end
