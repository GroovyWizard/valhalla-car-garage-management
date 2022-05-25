require "test_helper"

class DashboardTest < ActiveSupport::TestCase
   include Devise::Test::IntegrationHelpers # Rails >= 5
   # test "the truth" do
  #   assert true
  # end

  test "dashboard should not save if comission is greater than 100" do
    @dash = Dashboard.create(comission_percentage: 190)

    assert_equal false, @dash.save
  end

  test "featured user should find the user with mosts sales associated with it" do
    50.times do
      fixture
    end

    @user = User.create(email: 'josifo@pepe.com', name: "garrosh hellscream", password: 'quick12121212', encrypted_password: "ronalde")
     
    @client = Client.create(name: "jeberson", document: "shahsjajhs")
    100.times do 
      @sale = Sale.create(name: "Test sale", client: @client, user: @user)
      @part2 = Part.create(name: "Test part2", value: 80.0)
      @sale_part_join = SalePart.create(sale: @sale, part: @part2)
    end 
    Dashboard.featured_user
  end

  def fixture
    @client = Client.create(name: "josefumi", document: "shahsjajhs")
    @user = User.create(email: Faker::Internet.email, name: Faker::Games::WorldOfWarcraft.hero, password: 'quick12121212', encrypted_password: "ronalde")
    @sale = Sale.create(name: "Test sale", client: @client, user: @user)
    @part2 = Part.create(name: "Test part2", value: 80.0)
    @sale_part_join = SalePart.create(sale: @sale, part: @part2)
  end

end
