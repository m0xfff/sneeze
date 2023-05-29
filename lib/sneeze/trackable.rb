# frozen_string_literal: true

require "active_support/concern"

module Sneeze
  # This module is included into ActiveRecord::Base by the initializer in
  # lib/sneeze.rb. It adds callbacks to record changes to the database.
  class Trackable
    extend ActiveSupport::Concern

    included do
      after_create :record_create
      after_update :record_update
      before_destroy :record_destroy
    end

    def record_create
      Sneeze::Tracker.record_change(:create, self)
    end

    def record_update
      Sneeze::Tracker.record_change(:update, self)
    end

    def record_destroy
      Sneeze::Tracker.record_change(:destroy, self)
    end
  end
end
