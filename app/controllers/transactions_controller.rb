class TransactionsController < ApplicationController

  def new
    @request = Transaction.new
  end

  def index
    @requests=Transaction.where("creator_id = ?", current_user.id)
  end

  def create
    @request = Transaction.new(request_params)
    @request.recipient_id = current_user.id
    @request.creator_id = params[:transaction][:creator_id]
    @request.status = 1
    if @request.save
      Notification.create(recipient: User.find_by(id: params[:transaction][:creator_id]), actor: current_user, action: "Sent you", notifiable: @request)
    else
      #TODO: Display error message
    end
    redirect_to user_path(params[:transaction][:creator_id])
  end

  def edit
    @request = Transaction.find(params[:id])
  end

  def update
    @request = Transaction.find_by(id: params[:id])
    puts @request.inspect
    if params["accept_status"] == "accept"
      @request.update_attribute(:status, 2)
      #TODO: SEND MESSAGE
    elsif params["accept_status"] == "decline"
      @request.update_attribute(:status, -1)
      #TODO: SEND MESSAGE
    end
    redirect_to dashboard_path
  end

  def remove
    if params[:id]
        Transaction.destroy(params[:id])
        flash[:success] = "Sucessfully Declined!"
        redirect_to '_self'
    end
  end

  def show
    @request = Transaction.find_by :transaction_id
  end

  private
     def request_params
       params.require(:transaction).permit(:request_message, :transaction_title, :deadline, :status)
     end

     def get_request
       @request = Transaction.find(params[:id])
     end
end
