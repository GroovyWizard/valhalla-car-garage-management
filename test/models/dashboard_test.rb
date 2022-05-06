require "test_helper"

class DashboardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "override model" do 
    
    @first = Dashboard.create(comission_percentage: 12.4)
    @second = Dashboard.create(comission_percentage: 67.2)
    assert Dashboard.first.comission_percentage == @second.comission_percentage
  end 
end
