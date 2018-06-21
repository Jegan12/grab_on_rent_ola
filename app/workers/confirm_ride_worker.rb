  class ConfirmRideWorker
    include Sidekiq::Worker

    def perform(id)
      Ride.find(id).update_attributes(update_params)
    end

    def update_params
      {
          drop_time: Time.now,
          status: 'complete'
      }
    end
  end
