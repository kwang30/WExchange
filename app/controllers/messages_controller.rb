class MessagesController < ApplicationController

  def create
    puts "============="
    puts params
    if(!params[:message][:recipient_name].nil?)
      recipient = User.find_by(display_name: params[:message][:recipient_name])
      @chat = Chat.get(current_user.id, recipient.id)
    else
      @chat = Chat.includes(:recipient).find(params[:chat_id])
    end
    @message = @chat.messages.create(message_params)

    if @message.user_id == @chat.sender_id
      sender_id = @chat.sender_id
      recipient_id = @chat.recipient_id
    elsif @message.user_id == @chat.recipient_id
      sender_id = @chat.recipient_id
      recipient_id = @chat.sender_id
    end

    pusher = Pusher::Client.new(
      app_id: ENV['PUSHER_APP_ID'],
      key: ENV['PUSHER_KEY'],
      secret: ENV['PUSHER_SECRET'],
      cluster: ENV['PUSHER_CLUSTER'],
    )

    pusher.trigger("user_#{recipient_id}" , 'refresh_chats', {
        current_chat: @chat.id
    })

    Notification.create(recipient: User.find_by(id: recipient_id), actor: User.find_by(id: sender_id), action: "sent you a message", notifiable: @chat, destination_url: chats_path)
    respond_to do |format|
      format.js
    end

  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end
end
