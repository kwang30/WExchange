class PortfoliosController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save!
      redirect_to current_user # change hardcoding
    else
      redirect_to current_user # TEMP: To avoid crashing out on failture to create
    end
  end

  def upload_images
    @photo=Portfolio.find(params[:id]).photos.build(photo_params)
    @photo.save!
    redirect_to current_user
  end

  def addPhoto
    @portfolio = Portfolio.find(params[:id])
    @photo = @portfolio.photos.new
    @photo.imageable_id = @portfolio.id
  end


  def show
    @portfolio = Portfolio.find(params[:id])
  end



  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def delete
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to current_user
  end

  def update
    @portfolio = Portfolio.find_by(id: params[:id])
    if @portfolio.update_attributes(portfolio_params)
      redirect_to current_user
    else
      render :controller => :portfolios, :action => :new
    end
  end

    private
    def portfolio_params
      params.require(:portfolio).permit(:name, :description, :user_id, :images)
    end

    def get_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:portfolio_id, :image, :portfolio_name)
    end

end
