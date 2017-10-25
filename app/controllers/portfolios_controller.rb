class PortfoliosController < ApplicationController
  def index
  end

  def new
    @portfolio = Portfolio.new
  end

  def show
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      flash[:success] = "Successfully created a new portfolio!!"
      redirect_to @user # change?  
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
    def request_params
       params.require(:portfolio).permit(:name, :description)
     end

     def get_portfolio
       @portfolio = Portfolio.find(params[:id])
     end

end
