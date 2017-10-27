class PortfoliosController < ApplicationController
  def index
  end

  def new
    @portfolio = Portfolio.new
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save!
      puts "SUCCESS"
      flash[:success] = "Successfully created a new portfolio!!"
      redirect_to '/profile' # change hardcoding
    else
      puts "failed"
      redirect_to '/profile' # TEMP: To avoid crashing out on failture to create
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def destroy
  end

  def update
  end

    private
    def portfolio_params
      params.require(:portfolio).permit(:name, :description, :user_id)
    end

    def get_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

end
