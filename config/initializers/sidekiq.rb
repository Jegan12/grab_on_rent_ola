
Sidekiq.configure_server do |config|
  config.redis = { url: GrabOnRent.config.sidekiq_redis_uri }
end

Sidekiq.configure_client do |config|
  config.redis = { url: GrabOnRent.config.sidekiq_redis_uri }
end
