require "test_helper"

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "sale value should be changed when sale object is updated" do
    @sale = Sale.create(name: "Test sale")
    @part2 = Part.create(name: "Test part2", value: 80.0)
    @sale_part_join = SalePart.create(sale: @sale, part: @part2)
    assert_equal 80.0, @sale.value
  end

  test "sale should be created even without service_id" do 
    @sale = Sale.create(name: "Sale without service_id")
    
    assert_equal true, @sale.save
  end 

end
