class Driver < User
  extend CalculateDistance
  def self.nearest_rides(rides, points)
    _hash = {}
    _hash.default_proc = proc { |hash, key| hash[key] = [] }
    hash = rides.each_with_object(_hash) do |ride, hash|
      key = distance(ride.lat_long, points)
      hash[key] += [ride]
    end
    hash.sort_by { |key, _val| key }.to_h.values.flatten.first(count)
  end

  def self.count
    GrabOnRent.config.ride_count.to_i
  end
end
