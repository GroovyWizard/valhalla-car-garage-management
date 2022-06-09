require "test_helper"

class PartTest < ActiveSupport::TestCase

  test "Part default attributes should be set when none is passed" do
    incomplete_part = Part.create(name: "solid snake" )
    assert_not_nil incomplete_part.value, incomplete_part.model 
  end
  
  test "Part without a provider should receive the default one" do
    incomplete_part = Part.create(name: "revolver ocelot")

    assert_not_nil incomplete_part.provider

  end 
  
  test "Part has_sale should return false if Part has no sale" do 
    part_without_sale = Part.create(name: "liquid snake")
    assert_equal part_without_sale.has_sale, false
  end 
  
  test "Part sales count should bring the part with more Sales first" do 
    
  end 

end
