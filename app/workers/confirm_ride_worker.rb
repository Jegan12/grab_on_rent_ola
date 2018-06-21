class ConfirmRideWorker
  include Sidekiq::Worker

  def perform(id)

    @a=Ride.find(id)
    @a.drop_time=Time.now
    @a.status='complete'
    @a.save
  end


end
