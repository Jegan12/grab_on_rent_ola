require "dry-configurable"

module GrabOnRent
  extend Dry::Configurable
  setting :application
  setting :default_customer_password
  setting :ride_count
  setting :sidekiq_redis_uri
end

GrabOnRent.configure do |config|
  config.application = ENV.fetch('APPLICATION')
  config.default_customer_password = ENV.fetch('DEFAULT_PASSWORD') { 'default' }
  config.ride_count = ENV.fetch('RIDE_COUNT') { '10' }
  config.sidekiq_redis_uri = ENV.fetch('SIDEKIQ_REDIS_URI')

end