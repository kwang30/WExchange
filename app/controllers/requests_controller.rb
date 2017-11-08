class TransactionsController < ApplicationController

  def new
    @request = Transaction.new
  end

  def index
    @requests=Transaction.where("creator_id = ?", current_user.id)
  end

  def create
    @request =Transaction.new(request_params)
    @request.recipient_id = current_user.id
    @request.creator_id = params[:transaction][:creator_id]
    if @request.save
      Notification.create(recipient: params[:transaction][:creator_id], actor: current_user, action: "Sent you", notifiable: @request)
    else
      #TODO: Display error message
    end
    redirect_to user_path(params[:transaction][:creator_id])
  end

  def edit
    @request = Transaction.find(params[:id])
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
       params.require(:transaction).permit(:request_message)
     end

     def get_request
       @request = Transaction.find(params[:id])
     end
end
