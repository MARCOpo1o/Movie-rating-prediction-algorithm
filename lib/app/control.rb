# runs the two other methods
require_relative 'validator'
require_relative 'ratings'
class Control
  def initialize(base_case, test_case)
    @base_case = base_case
    @test_case = test_case
  end

  def run
    val = Validator.new(@base_case, @test_case)
    val.validate
    val.stats
  end
end

# cntrl = Control.new('data/u1.base', 'data/u1.test')
# puts cntrl.run
