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
    @name = @user.first_name + " " + @user.last_name
    @portfolios=Portfolio.where(" id = ?", current_user.id)
    @reviews = @user.reviews
    @portfolio=Portfolio.new
    @portfolio.photos.build
    @tags = ActsAsTaggableOn::Tag.all

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
      redirect_to @user
    else
      render 'new'
    end
  end

  def addPic
    @user=current_user
  end

  def update
    @user = current_user;
    if @user.update_attribute(:image, params[:user][:image])
          flash[:success] = "Profile picture updated."
          redirect_to @user
      else
          flash[:danger] = "Failed to update profile picture."
      end
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      puts "FAIL"
    end
  end

 private
   def user_params
     params.require(:user).permit(:username, :first_name, :last_name, :email, :biography,
                                  :display_name, :password, :password_confirmation, :image, tag_list: [])
   end
end
