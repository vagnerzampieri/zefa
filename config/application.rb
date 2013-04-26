require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module Zefa
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    config.autoload_paths += %W(#{config.root}/lib/extras)
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.time_zone = "Brasilia"
    config.i18n.default_locale = :"pt-BR"
    config.active_record.default_timezone = :local
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end
