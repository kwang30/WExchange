class ChatsController < ApplicationController
  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.get(current_user.id, params[:user_id])

    add_to_chats unless conversated?

    respond_to do |format|
      format.js
    end
  end

  def index
    session[:chats] ||= []

    @users = User.all.where.not(id: current_user)
    @chats = Chat.includes(:recipient, :messages)
  end

  def refresh
    @users = User.all.where.not(id: current_user)
    @chats = Chat.includes(:recipient, :messages)
    respond_to do |format|
      format.js { render '../views/chats/refresh_chats.js.erb', locals: {chat_id: params[:chat_id]} }
    end
  end

  private

  def add_to_chats
    session[:chats] ||= []
    session[:chats] << @chat.id
  end

  def conversated?
    session[:chats].include?(@chat.id)
  end

end
