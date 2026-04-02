class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  throttle("posts/ip", limit: 60, period: 1.minute) do |req|
    req.ip if req.path == "/posts" && req.post?
  end

  throttle("posts/user", limit: 10, period: 1.minute) do |req|
    req.env["warden"]&.user&.id if req.path == "/posts" && req.post?
  end

  blocklist("block prolific posters") do |req|
    Rack::Attack::Allow2Ban.filter("poster-#{req.env['warden']&.user&.id}", maxretry: 10, findtime: 1.minute, bantime: 10.minutes) do
      req.path == "/posts" && req.post?
    end
  end
end

Rails.application.config.middleware.use Rack::Attack
