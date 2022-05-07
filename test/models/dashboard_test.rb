require "test_helper"

class DashboardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 test "dashboard should not save if comission is greater than 100" do
    @dash = Dashboard.create(comission_percentage: 190)
    
    assert_equal false, @dash.save
 end
 
 

end  
