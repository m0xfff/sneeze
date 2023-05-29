# frozen_string_literal: true

require "test_helper"

class TrackableTest < Minitest::Test
  def setup
    @dummy = DummyModel.create(name: "Test")
  end

  def test_create
    assert_equal 1, Sneeze::Tracker.log.count
    assert_equal :create, Sneeze::Tracker.log.first[:action]
  end

  def test_update
    @dummy.update(name: "Updated")
    assert_equal 2, Sneeze::Tracker.log.count
    assert_equal :update, Sneeze::Tracker.log.last[:action]
  end

  def test_destroy
    @dummy.destroy
    assert_equal 2, Sneeze::Tracker.log.count
    assert_equal :destroy, Sneeze::Tracker.log.last[:action]
  end
end
