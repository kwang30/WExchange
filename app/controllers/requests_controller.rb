class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def index
    @requests=Request.all
  end

  def create
    @request=Request.new(request_params)
    @request.creator_id=current_user.id
    @request.recipient_id=params[:id]
    @request.status="Submitted"
    if @request.save
      flash[:success] = "Thanks! I'll be in touch soon!"
      redirect_to :action => 'comfirm', :id => params[:id]
    end
  end



    def comfirm
      @user=User.where("id = ?", params[:id].to_i).last
      @request=Request.where("creator_id = ?", current_user.id).last
    end



  def show
    @request = Request.find_by :transaction_id
    @user=User.find_by
  end


  private
     def request_params
       params.require(:request).permit(:amount)
     end
  end
