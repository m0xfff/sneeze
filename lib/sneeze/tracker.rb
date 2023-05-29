# frozen_string_literal: true

module Sneeze
  class Tracker
    @@log = []

    def self.record_change(action, record)
      @@log << { action: action, record: record.attributes }
    end

    def self.log
      @@log
    end

    def self.generate_seed
      # logic here to generate a seed file from the recorded changes.
      # For now let's just return the log.
      @@log
    end

    def self.reset
      @@log = []
    end
  end
end
