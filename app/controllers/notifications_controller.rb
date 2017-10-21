class NotificationsController < ApplicationController
  def notifications
  end

  def index
      @notifications = Notification.all.reverse
  end

  
end
