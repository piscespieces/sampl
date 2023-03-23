Sidekiq.configure_server do |config|
  config.redis = { url: "redis://red-cgc7iqo2qv267ubpeaf0:6379" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://red-cgc7iqo2qv267ubpeaf0:6379" }
end