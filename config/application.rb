# -*- coding: utf-8 -*-
require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cloneds
  class Application < Rails::Application

    # Glyphicons of Bootstrap3
    config.assets.paths << "#{Rails}/vendor/assets/fonts"

    # timezoneを東京に合わせる
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # specファイルの自動生成
    config.generators do |g|
      g.test_framework :rspec,
      fixtures:         true,
      view_specs:       false,
      helper_specs:     false,
      routing_specs:    false,
      controller_specs: true,
      request_specs:    false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
