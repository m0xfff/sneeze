# frozen_string_literal: true

require "bigdecimal"

class BigDecimal
  def self.new(*args, **kwargs)
    BigDecimal(*args, **kwargs)
  end
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "sneeze"
require "active_record"
require "sqlite3"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

# Create a dummy table for tests
ActiveRecord::Schema.define do
  create_table :dummy_models, force: true do |t|
    t.string :name
  end
end

# Define a dummy model for the test
class DummyModel < ActiveRecord::Base
  include DbChangeTracker::Trackable
end

require "minitest/autorun"
