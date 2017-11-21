class MessagesController < ApplicationController
  def create
    @chat = Chat.includes(:recipient).find(params[:chat_id])
    @message = @chat.messages.create(message_params)
    Notification.create(recipient: User.find_by(id: @chat.recipient_id), actor: User.find_by(id: @chat.sender_id), action: "sent you a message", notifiable: @chat, destination_url: chats_path)
    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content)
  end
end
