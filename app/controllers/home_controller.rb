class HomeController < ApplicationController
  def show
  end

  def update_navigation
    @notifications = Notification.where(recipient: current_user).unread
    respond_to do |format|
      format.js { render '../views/home/refresh_nav_notifications.js.erb' }
    end
  end

end
