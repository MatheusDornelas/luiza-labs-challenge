Sidekiq.strict_args!(false)
Sidekiq.configure_server do |config|
  config.redis = { db:1, url: 'redis://redis:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { db:1, url: 'redis://redis:6379/0' }
end