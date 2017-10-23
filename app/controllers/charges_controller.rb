class ChargesController < ApplicationController
	def new
		# @room = Room.find(params[:r])
	end

	def create
		@booking = Booking.find(params[:id])
	  # Amount in cents
	  @amount = (@booking.room.price * 100).to_i

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => "Booking id: #{@booking.id}",
	    :currency    => 'aud'
	  )

		@transaction = Transaction.create(amount: @amount, user_id: current_user.id, booking_id: @booking.id)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to guestdashboard_path
	end
end

class ChargesController < ApplicationController
  def new
  end

  def edit
  end

  def create
    customer = current_user.customer
    subscription = customer.subscriptions.create(
        source: params[:stripeToken],
        plan: "monthly"
    )

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
    }
    # Only update card on file if we are adding a new one.
    options.merge!(
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_type]
    ) if params[:card_last4]

    current_user.update(options)

    redirect_to root_path, notice: "Thank you for subscribing."
  end

  def destroy
    customer = current_user.customer
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.remove_subscription

    redirect_to root_path, notice: "Your subscription has been cancelled"
  end

  private

  def redirect_for_new_action
    if !user_signed_in?
      session["user_return_to"] = new_subscription_path
      redirect_to new_user_registration_path
    elsif !current_user.stripe_subscription_id.nil?
      redirect_to edit_subscription_path
    end
  end

  def user_subscribed!
    redirect_to new_subscription_path, alert: "You must be subscribed to use this application" unless current_user_subscribed?
  end

end
