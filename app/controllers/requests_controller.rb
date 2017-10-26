class RequestsController < ApplicationController
  after_create_commit { notify }

  def new
    @request = Request.new
  end

  def index
    @requests=Request.where("creator_id = ?", current_user.id)
  end

  def create
    @request=Request.new(request_params)
    @request.recipient_id=params[:id]
    @request.creator_id=current_user.id
    if @request.save
      # create notification to usera
      flash[:success] = "Thanks! I'll be in touch soon!"
      redirect_to :action => 'thanks', :id => params[:id]
    end
  end


  def edit
    @request = Request.find(params[:id])
  end



  def reject
    @request = Request.find(params[:id])
    @request.status="REJECTED"
  end





  def comfirm
    @request = Request.find(params[:id])
    @request.status="COMFIRMED"
  end



  def remove
    if params[:id]
        Request.destroy(params[:id])
        flash[:success] = "Sucessfully Declined!"
        redirect_to '_self'
    end
  end




    def thanks
      @user=User.where("id = ?", params[:id].to_i).last
      @request=Request.find(params[:id])
    end



  def show
    @request = Request.find_by :transaction_id
  end


  private
    def notify
      Notification.create(event: "New Notification")
    end
     def request_params
       params.require(:request).permit(:amount)
     end

     def get_request
       @request = Request.find(params[:id])
     end
end

