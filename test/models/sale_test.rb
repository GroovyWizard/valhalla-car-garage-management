require "test_helper"

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "sale value should be changed when sale object is updated" do
    @sale = Sale.create(name: "essa merda bugando")
    @part2 = Part.create(name: "Test part2", value: 80.0, sale: @sale)
    @part = Part.create(name: "Test part 1", value: 3.0, sale: @sale)
    @value = @sale.value
    assert_equal 83.0, @value
  end
end
