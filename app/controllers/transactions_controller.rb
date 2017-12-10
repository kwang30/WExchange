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
    @request.status = 0
    if @request.save
      Notification.create(recipient: User.find_by(id: params[:transaction][:creator_id]), actor: current_user, action: "sent you a request", notifiable: @request, destination_url: dashboard_path)
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
    if params["creator_accept"]
      creator_accept_request @request
    elsif params["creator_decline"]
      creator_decline_request @request
    elsif params["client_accept_price"]
      client_accept_price @request
    elsif params["client_decline_price"]
      client_decline_price @request
    elsif params["send_content"]
      creator_send_content @request
    elsif params["client_accept"]
      client_accept_content @request
    elsif params["request_edits"]
      client_request_edits @request
    elsif params["cancel"]
      cancel @request
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

  def creator_accept_request(request)
    request.update_attribute(:status, 1)
    request.update_attribute(:response_message, params[:transaction][:response_message])
    Notification.create(recipient: User.find_by(id: request.recipient_id), actor: User.find_by(id: request.creator_id), action: "accepted your request", notifiable: @request, destination_url: dashboard_path)
  end

  def creator_decline_request(request)
    request.update_attribute(:status, -1)
    request.update_attribute(:response_message, params[:transaction][:response_message])
    Notification.create(recipient: User.find_by(id: request.recipient_id), actor: User.find_by(id: request.creator_id), action: "declined your request", notifiable: @request, destination_url: dashboard_path)
  end

  def client_accept_price(request)
    request.update_attribute(:status, 2)
    Notification.create(recipient: User.find_by(id: request.creator_id), actor: User.find_by(id: request.recipient_id), action: "accepted your price", notifiable: @request, destination_url: dashboard_path)
  end

  def client_decline_price(request)
    request.update_attribute(:status, -4)
    Notification.create(recipient: User.find_by(id: request.creator_id), actor: User.find_by(id: request.recipient_id), action: "declined your price", notifiable: @request, destination_url: dashboard_path)
  end

  def creator_send_content(request)
    request.update_attribute(:status, 3)
    Notification.create(recipient: User.find_by(id: request.recipient_id), actor: User.find_by(id: request.creator_id), action: "sent content for your request", notifiable: @request, destination_url: dashboard_path)
  end

  def client_accept_content(request)
    request.update_attribute(:status, 4)
    creator = User.find_by(id: request.creator_id)
    client = User.find_by(id: request.recipient_id)
    creator.update_attribute(:balance, creator.balance + request.price)
    client.update_attribute(:balance, client.balance - request.price)
    Notification.create(recipient: creator, actor: client, action: "accepted your work", notifiable: @request, destination_url: dashboard_path)
  end

  def client_request_edits(request)
    request.update_attribute(:status, 4)
    Notification.create(recipient: User.find_by(id: request.creator_id), actor:User.find_by(id: request.recipient_id), action: "requested edits to your work", notifiable: @request, destination_url: dashboard_path)
  end

  def cancel(request)
    if request.recipient_id == current_user.id
      request.update_attribute(:status, -2)
      Notification.create(recipient: User.find_by(id: request.creator_id), actor:User.find_by(id: request.recipient_id), action: "cancelled their request", notifiable: @request, destination_url: dashboard_path)
    elsif request.creator_id == current_user.id
      request.update_attribute(:status, -3)
      Notification.create(recipient: User.find_by(id: request.recipient_id), actor: User.find_by(id: request.creator_id), action: "cancelled your request", notifiable: @request, destination_url: dashboard_path)
    end
  end

  private
     def request_params
       params.require(:transaction).permit(:request_message, :transaction_title, :deadline, :status, :price)
     end

     def get_request
       @request = Transaction.find(params[:id])
     end
end
