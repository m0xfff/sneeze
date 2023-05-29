# frozen_string_literal: true

require_relative "sneeze/tracker"
require_relative "sneeze/trackable"
require_relative "sneeze/version"

require "rails/railtie"

module Sneeze
  class Error < StandardError; end

  class Railtie < Rails::Railtie
    initializer "sneeze.insert_into_active_record" do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.include Trackable
      end
    end
  end
end
