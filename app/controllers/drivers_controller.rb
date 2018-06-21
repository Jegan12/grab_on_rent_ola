class DriversController < ApplicationController

  def confirm_ride
    @ride=Ride.find(id)
    if @ride.update_attributes(update_params)
      # ConfirmRideJob.set(wait: 1.minutes).perform_later(id)
      ConfirmRideWorker.perform_in(1.minutes, id)
      render json: {
          status: true,
          message: %(Ride is confirmed)
      }
    else
      render json: {
          status: false,
          message: @ride.errors.to_a
      }
    end
  end

  def driver_home_page
    @rides = Ride.all_by_driver(lat_long_points).merge(status) do |_k, old, new|
      old + new
    end

  end
  private

  def id
    params.fetch(:id)
  end

  def update_params
    {
        driver_id: current_user.id,
        status: 'on_going',
        pick_up_time: Time.now
    }
  end
  def path(obj)
    drivers_url(obj)
  end

  def lat_long_points
    current_user.lat_long
  end


  def status

    hash = {}
    hash.default_proc = proc{|hash, key| hash[key] = []}
    Ride.statuses.keys.each{|key|hash[key]}
    # {}.tap do |hash|
    #   Ride.statuses.keys.each do |key|
    #     hash[key] = []
    #     end
    #   end
    return hash
  end
end
