redis_config = Rails.application.config_for(:redis).symbolize_keys
Sidekiq.configure_server do |config|
  config.redis = {url: "redis://#{redis_config[:redis_server]}:#{redis_config[:redis_port]}/#{redis_config[:redis_sidekiq_num]}", id: nil}
end
Sidekiq.configure_client do |config|
  config.redis = {url: "redis://#{redis_config[:redis_server]}:#{redis_config[:redis_port]}/#{redis_config[:redis_sidekiq_num]}", id: nil}
end