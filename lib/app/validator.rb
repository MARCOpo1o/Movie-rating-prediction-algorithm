require_relative 'ratings'
class Validator
  # Takes two instances of Ratings, one representing a base set and
  # the other representing a test set. Has one important method, validate,
  # which runs through all the entries in the test set and see what
  # ratings would be predicted vs. which ones were given. Compute statistics
  # about the prediction: how many predictions were exact, off by one, etc.
  # Also the mean and stdev of the difference between the two.

  def initialize(base_case, test_case)
    @base_ratings = Ratings.new(base_case)
    @base_ratings.hash_user
    @test = open(test_case)
    @prediction = []
    @exact_count = 0
    @off_by_one_count = 0
    @off_by_more_count = 0
  end

  # use ratings' predict(user, movie) to plug in info from the test file
  def validate
    @test.each do |line| # adding the info to hash
      curr = line.split
      diff = (curr[2].to_i - @base_ratings.predict(curr[0], curr[1])).abs
      if diff == 0
        @exact_count += 1
      elsif diff <= 1
        @off_by_one_count += 1
      else
        @off_by_more_count += 1
      end
      @prediction.append diff
    end
  end

  # the answer [amount of exact ratings, amount of ratings off by one,
  # amount of ratings off by more than one, mean of difference, stdev of the difference]
  def stats
    stdev = Math.sqrt(@prediction.sum(0.0) do |num|
                        (num - @prediction.sum(0.0) / @prediction.size)
                      end / (@prediction.size - 1))
    [@exact_count, @off_by_one_count, @off_by_more_count, @prediction.sum(0.0) / @prediction.size, stdev]
  end
end
