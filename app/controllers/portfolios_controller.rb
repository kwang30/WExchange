class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save!
      flash[:success] = "Successfully created a new portfolio!!"
      redirect_to '/profile' # change hardcoding
    else
      redirect_to '/profile' # TEMP: To avoid crashing out on failture to create
    end
  end


  def upload_images
    @photo=Portfolio.find(params[:id]).photos.build(photo_params)
    @photo.save!
    redirect_to current_user
  end


  def addPhoto
    @portfolio=Portfolio.find(params[:id])
    @photo=@portfolio.photos.new
    @photo.imageable_id=  @portfolio.id
  end



  def delete
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to current_user
  end




  def show
    @portfolio = Portfolio.find(params[:id])
  end



  def edit
    @portfolio = Portfolio.find(params[:id])
  end




  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update_attributes(params[:portfolio])
      redirect_to current_user
    else
      render :controller => :portfolios, :action => :new
    end
  end




    private
    def portfolio_params
      params.require(:portfolio).permit(:name,:description, :user_id, :images)
    end

    def get_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:portfolio_id, :image, :portfolio_name)
    end


end
