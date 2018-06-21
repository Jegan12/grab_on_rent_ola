class BookingsController < ApplicationController
  def create_ride
    if create_booking?

      Ride.create(ride_params)
      render json: {
          status: true,
          message: %(Your Ride is confirmed.Driver will be assigned shortly)
      }
    else
      render json: {
          status: false,
          message: message
      }
    end
  end

  private

  def customer_params
    params.permit(:name, :email, :phone_no).merge(password: password)
  end

  def ride_params
    params.permit(:lat, :long).merge(customer_id: customer.id)
  end

  def password
    GrabOnRent.config.default_customer_password
  end

  def check_rides?
    Ride.waiting.count < 10
  end

  def create_customer?
    @customer = Customer.find_or_create(email, customer_params)
    customer.errors.blank?
  end

  def email
    { email: customer_params[:email] }
  end

  attr_reader :customer
  def create_booking?
    check_rides? && create_customer?
  end

  def message
    !check_rides? ? ride_message : customer.errors.to_a
  end

  def ride_message
    %(Drivers not available right now.Please try Again)
  end
end
