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
      redirect_to '/profile' # change hardcoding
    else
      puts "failed"
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
