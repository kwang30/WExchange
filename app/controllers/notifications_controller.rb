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

  def mark_all_as_read
    @incoming_requests = Transaction.where(creator_id: current_user.id)
    @incoming_requests = @incoming_requests.sort_by {|request| request.deadline}
    @outgoing_requests = Transaction.where(recipient_id: current_user.id)
    @outgoing_requests = @outgoing_requests.sort_by {|request| request.deadline}
    @notifications = Notification.where(recipient: current_user)
    @notifications.each do |notification|
      notification.update(read_at: Time.zone.now)
      puts notification.errors.full_messages
    end

    respond_to do |format|
      format.js { render '../views/dashboard/refresh_dashboard_notifications.js.erb' }
    end
  end

end
