# frozen_string_literal: true

require "test_helper"

class TestSneeze < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Sneeze::VERSION
  end
end
