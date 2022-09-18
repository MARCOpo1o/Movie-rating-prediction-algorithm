# This test is testing Class1 so it has to require it

require_relative "test_helper"
require_relative "../lib/app/ratings.rb"

class TestMovies < Minitest::Test
  def test_it_does_something_useful
    a = Ratings.new("../lib/app/data/u1.base")
    thing.hash_user()
    assert_equal 3 thing.predict("1", "6")
  end
end
