class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request.creator_id  = current_user.id
    @request.recipient_id=
    @request.creation_date=
    @request.completion_date=
    @request.amount=
    @request.status=
    @request.approval_status=params[:submitted]
    if @request.save
      render :thanks
    else
      flash[:notices] = ["You are missing some paramters"]
    end
  end



  def show
    @request = Request.find_by :transaction_id
  end


  def thanks
  end


  def edit
  end


  def destroy
  end

  def update
  end


  def cancel

  end

  def decline

  end



  def approve
    @request = Booking.find_by_id(params[:id])
      if @booking.space.owner_id == current_user.id
          @booking.update_approval_status("approve")
        else
        redirect_to(:back)
      end
  end



   private

     def user_params
       params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
     end

  end
