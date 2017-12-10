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
    @user.balance = 0;
    if @user.save
      log_in @user
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages
      render 'new'
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

  def destroy
    @user = current_user;
    log_out # not sure if necessary
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  render

  def autocomplete
    render json: ["test"]
    # User.search(params[:search_query], {
    #   fields: ["first_name, full_name, last_name, email"],
    #   match: :word_start,
    #   limit: 10,
    #   load: false,
    #   misspellings: {below: 5}
    #   }).map(&:full_name)
  end

 private
   def user_params
     params.require(:user).permit(:username, :first_name, :last_name, :email, :biography,
                                  :display_name, :password, :password_confirmation, :image, tag_list: [])
   end
end
