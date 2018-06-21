class AdminController < ApplicationController

def dash_board
  @rides = Ride.includes(:customer)
  render template: 'admin/dashboard'
end
  private
  def path(_obj)
    admin_url
  end

end
