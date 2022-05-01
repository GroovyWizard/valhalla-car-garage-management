require "test_helper"

class PartTest < ActiveSupport::TestCase

  test "Part default attributes should be set when none is passed" do
    incomplete_part = Part.create(name: "solid snake" )
    assert_not_nil incomplete_part.value, incomplete_part.model 
  end


end
