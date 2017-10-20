class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
      @user = User.find(params[:id])
  end

  def index
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def drop
    if params[:id]
      Enrollment.destroy(params[:id])
      flash[:success] = "Sucessfully Dropped!"
      redirect_to current_user
    end
  end


 private

   def user_params
     params.require(:user).permit(:username, :first_name, :last_name, :email,
                                  :password, :password_confirmation)
   end

end
