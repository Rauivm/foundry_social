require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module FoundrySocial
  class Application < Rails::Application
    config.load_defaults 7.1
    config.time_zone = "UTC"
    config.active_storage.variant_processor = :mini_magick
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: true
      g.system_tests = nil
    end
  end
end
