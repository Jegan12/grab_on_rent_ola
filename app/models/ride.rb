class Ride < ApplicationRecord
  belongs_to :customer

  enum status: {
      waiting: 0,
      on_going: 1,
      complete: 2
  }


  def self.all_by_driver(points)
    rides.each_with_object({}) do |(key, val), hash|
      hash[key] = key == 'waiting' ? Driver.nearest_rides(val, points) : val
    end
  end

  def self.rides
    Ride.includes(:customer).group_by(&:status)
  end


end

