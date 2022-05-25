require "test_helper"

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "comission value should be correctly calculated based on the parameter set by the admin inside dashboard" do 
    Dashboard.create(id:1, comission_percentage: 10)
    @client = Client.create(name: 'josefumi', document: 'shahsjajhs'  )
    @user = User.create(name: 'josi', password: 'ronalde' )
    @sale = Sale.create(name: "Test sale", client: @client, user: @user)
    @part2 = Part.create(name: "Test part2", value: 80.0)
    @sale_part_join = SalePart.create(sale: @sale, part: @part2)
    @final_sale = Sale.find(@sale.id).comission_value
    assert_equal 8.0,  @final_sale
  end 

  test "sale value should be changed when sale object is updated" do
    @client = Client.create(name: 'josefumi', document: 'shahsjajhs'  )
    @user = User.create(name: 'josi', password: 'ronalde' )
    @sale = Sale.create(name: "Test sale", client: @client, user: @user)
    @part2 = Part.create(name: "Test part2", value: 80.0)
    @sale_part_join = SalePart.create(sale: @sale, part: @part2)
    assert_equal 80.0, @sale.value
  end

  test "sale should be created even without service_id" do 
    @client = Client.create(name: 'josefumi', document: 'shahsjajhs'  )
    @user = User.create(name: 'ronaldo', password: 'megadeth' ) 
    @sale = Sale.create(name: "Sale without service_id", client: @client, user: @user)

    
    assert_equal true, @sale.save
  end 
  
  test 'sale should receive correct name' do
    @user = User.create(name: 'josi', password: 'ronalde' )
    @client = Client.create(name: 'josefumi', document: 'shahsjajhs'  )
    @sale = Sale.create(client: @client, user: @user) 
    assert_equal true, @sale.name.start_with?('Orçamento para josefumi') 
  end

  test 'sale should have the correct total value when it has a service' do 
    @client = Client.create(name: 'josefumi', document: 'shahsjajhs'  )
    @vehicle = Vehicle.create(model: 'supla', registration_plate: 'AKM8765', client: @client)
    @service = Service.create(title: 'ronaldo', vehicle: @vehicle, status: false, value: 127 )
    @user = User.create(name: 'josi', email: 'xbox@milgrau.com', password: 'ronalde' )
    @sale = Sale.create(name: "Test sale", service: @service, user: @user)
    @part2 = Part.create(name: "Test part2", value: 80.0)
    @sale_part_join = SalePart.create(sale: @sale, part: @part2)
    assert_equal 207.0, @sale.get_total_value
  end 

end
