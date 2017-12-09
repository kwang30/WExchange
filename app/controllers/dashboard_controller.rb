class DashboardController < ApplicationController

  require 'json'

  def show
    @incoming_requests = Transaction.where(creator_id: current_user.id)
    @incoming_requests = @incoming_requests.sort_by {|request| request.deadline}
    @outgoing_requests = Transaction.where(recipient_id: current_user.id)
    @outgoing_requests = @outgoing_requests.sort_by {|request| request.deadline}
    @requests = @incoming_requests + @outgoing_requests
    @markers = Hash.new
    @notifications = Notification.where(recipient: current_user)
  end

  def update_progress_tracker
    if params[:id]
      @selected_request = Transaction.where(id: params[:id])
    else
      @selected_request = Transaction.where(id: params[:progress]["request_id"])
    end
    @@request = @selected_request[0]
    if @@request.progress.nil?
      @markers = Hash.new
    else
      @markers = @@request.progress
    end
    if params[:progress]
      order = @markers.count.to_i
      @markers[params[:progress]["progress"]] = {completed: false, order: order}
      @request_to_save = Transaction.find_by(id: params[:progress]["request_id"])
      @request_to_save.progress = @markers
      @request_to_save.save
      puts @markers
    end
    @markers_to_show = @markers.sort_by{ |k, v| v[:order]}
    puts @markers
    respond_to do |format|
      format.js {
        render 'update_progress_tracker.js.erb'
      }
      format.json
    end
  end

  def update_marker
    marker_id = params[:id].sub!("marker-check-", "")
    @selected_request = Transaction.find_by(id: @request.id)

    @markers_to_update = @selected_request.progress
    puts @markers_to_update
    if @markers_to_update[params[:id]][:completed] == false
      @markers_to_update[params[:id]][:completed] = true
    else
      @markers_to_update[params[:id]][:completed] = false
    end
    @selected_request.progress = @markers_to_update
    @selected_request.save
    puts Transaction.find_by(id: @@request.id).progress
  end

  def swap_marker
    old_index = params[:old_index].to_i
    new_index = params[:new_index].to_i
    @selected_request = Transaction.find_by(id: @@request.id)
    @markers_to_update = @selected_request.progress.sort_by{ |k, v| v[:order]}
    item = @markers_to_update.select{ |k, v| v[:order] == old_index }
    item[0][1][:order] = new_index
    @markers_to_update.each do |x|
      if x[1][:order] >= new_index && x[0] != item[0][0]
        x[1][:order] = x[1][:order].to_i + 1
      end
    end
    puts '______________________'
    puts @markers_to_update
    @selected_request.progress = @markers_to_update
    @selected_request.save
    # old_index_item = @markers_to_update.select{ |k, v| v[:order] == old_index }
    # new_index_item = @markers_to_update.select{ |k, v| v[:order] == new_index }
    # if old_index_item.count == 1 && new_index_item.count == 1
    #   old_index_item[old_index_item.keys[0]][:order] = new_index
    #   new_index_item[new_index_item.keys[0]][:order] = old_index
    # end
    # @selected_request.progress = @markers_to_update
    # @selected_request.save
  end

  def refresh_notifications
    @notifications = Notification.where(recipient: current_user)
    @incoming_requests = Transaction.where(creator_id: current_user.id)
    @incoming_requests = @incoming_requests.sort_by {|request| request.deadline}
    @outgoing_requests = Transaction.where(recipient_id: current_user.id)
    @outgoing_requests = @outgoing_requests.sort_by {|request| request.deadline}
    puts @notifications.length
    respond_to do |format|
      format.js { render '../views/dashboard/refresh_dashboard_notifications.js.erb' }
    end
  end



end
