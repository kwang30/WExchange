class DashboardController < ApplicationController

  require 'json'

  def show
    @incoming_requests = Transaction.where(creator_id: current_user.id)
    @outgoing_requests = Transaction.where(recipient_id: current_user.id)
    @requests = @incoming_requests + @outgoing_requests
    @selected_request = Array.new
    @markers = Hash.new
  end

  def update_progress_tracker
    if params[:id]
      @selected_request = Transaction.where(id: params[:id])
    else
      @selected_request = Transaction.where(id: params[:progress]["request_id"])
    end
    @request = @selected_request[0]
    if @request.progress.nil?
      @markers = Hash.new
    else
      @markers = @request.progress
    end
    if params[:progress]
      @markers[params[:progress]["progress"]] = false
      @request_to_save = Transaction.find_by(id: params[:progress]["request_id"])
        @request_to_save.progress = @markers
        @request_to_save.save
    end

    respond_to do |format|
      format.js {
        render 'update_progress_tracker.js.erb'
      }
      format.json
    end
  end

  def add_marker

  end



end
