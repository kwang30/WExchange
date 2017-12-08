class NotificationsController < ApplicationController
  def index
      @notifications = Notification.where(recipient: current_user)
  end

  def mark_as_read
    puts params
    @notification = Notification.where(id: params[:notification_id])
    @notification.update(read_at: Time.zone.now)
    render json: {success: true}
  end

end
