class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users=User.all
  end

  def show
    if params[:id].nil?
      @user=current_user
    else
      @user=User.find(params[:id])
    end
    @user.full_name=@user.first_name + " " + @user.last_name
    @portfolios=Portfolio.where(" id = ?", current_user.id)
  end


  def profile
  end

  def index
    @users=User.all
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

  def addPic
    @user=current_user
  end

  def update
    @user=current_user;
    if @user.update_attribute(:image, params[:user][:image])
          flash[:success] = "Profile picture updated."
          redirect_to @user
      else
          flash[:danger] = "Failed to update profile picture."
      end
  end

 private
   def user_params
     params.require(:user).permit(:username, :first_name, :last_name, :email,
                                  :display_name, :password, :password_confirmation, :image)


   end
end
