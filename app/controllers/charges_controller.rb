class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    user = Stripe::User.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :user    => user.id,
      :amount      => @amount,
      :description => 'Rails Stripe user',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
