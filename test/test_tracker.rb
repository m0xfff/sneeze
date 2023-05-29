# frozen_string_literal: true

require "test_helper"

class TrackerTest < Minitest::Test
  def setup
    @tracker = DbChangeTracker::Tracker
    @dummy = DummyModel.create(name: "Test")
  end

  def test_record_change
    assert_equal 1, @tracker.log.count
    assert_equal :create, @tracker.log.first[:action]
  end

  def test_generate_seed
    seed = @tracker.generate_seed
    assert_equal 1, seed.count
    assert_equal :create, seed.first[:action]
  end
end
