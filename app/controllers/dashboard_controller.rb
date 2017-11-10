class DashboardController < ApplicationController

  def show
    @incoming_requests = Transaction.where(recipient_id: current_user.id)
    @outgoing_requests = Transaction.where(creator_id: current_user.id)
    @requests = @incoming_requests + @outgoing_requests
  end

end
