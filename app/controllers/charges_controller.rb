class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Premium Membership - #{current_user.username}",
      amount: default
    }
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: default,
      description: "Blocipedia Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

      flash[:notice] = "Thanks for subcribing, #{current_user.username}! You are now a premium member."
      current_user.premium!
      redirect_to wikis_path


    rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
  end

private
  def default
    return 500
  end
 
end