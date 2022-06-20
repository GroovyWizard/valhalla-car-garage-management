# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'pt-BR'

1.times do 
    Provider.where(:name => 'Fornecedor Local').first_or_create(
        :name => "Fornecedor Local",
        :cnpj => "Local",
        :phone => "Local",
        :address => "Local",
    )
end 

1.times do 
    admin = User.new 
    admin.email = 'super@admin.com'
    admin.role = 0
    admin.name = 'DarthVader'
    admin.password = '123456'
    admin.password_confirmation = '123456' 
    admin.save()
end

1.times do 
    func = User.new 
    func.email = 'super@func.com'
    func.role = 0
    func.name = 'Gandalf'
    func.password = '123456'
    func.password_confirmation = '123456' 
    func.save()
end

1.times do 
    func = User.new 
    func.email = 'normal@func.com'
    func.role = 1
    func.name = 'Legolas'
    func.password = '123456'
    func.password_confirmation = '123456' 
    func.save()
end

1.times do 
    dashboard = Dashboard.new 
    dashboard.comission_percentage = 10
    dashboard.save()
end 

10.times do 
    name = Faker::Name.name
    document = Faker::CPF.pretty
    phone = Faker::PhoneNumber.area_code #=> "201"
    address = Faker::Address.full_address
    @client = Client.create!(name: name, document: document, phone: phone, address: address )
    
    model = Faker::Vehicle.model
    registration_plate = Faker::Vehicle.license_plate
    client_id = @client.id
    Vehicle.create!(model: model, registration_plate: registration_plate, client_id: client_id)
end

10.times do 
    name = Faker::Movies::LordOfTheRings.character
    document = Faker::CPF.pretty
    phone = Faker::PhoneNumber.area_code #=> "201"
    address = Faker::Address.full_address
    @client = Client.create!(name: name, document: document, phone: phone, address: address )
    
    model = Faker::Vehicle.model
    registration_plate = Faker::Vehicle.license_plate
    client_id = @client.id
    Vehicle.create!(model: model, registration_plate: registration_plate, client_id: client_id)
end


10.times do 
    name = Faker::Movies::StarWars.character
    document = Faker::CPF.pretty
    phone = Faker::PhoneNumber.area_code #=> "201"
    address = Faker::Address.full_address
    
    @client = Client.create!(name: name, document: document, phone: phone, address: address )
    
    model = Faker::Vehicle.model
    registration_plate = Faker::Vehicle.license_plate
    client_id = @client.id
    Vehicle.create!(model: model, registration_plate: registration_plate, client_id: client_id)
end

5.times do 
    name = Faker::Games::Witcher.witcher
    document = Faker::CPF.pretty
    phone = Faker::PhoneNumber.area_code #=> "201"
    address = Faker::Address.full_address

    @client = Client.create!(name: name, document: document, phone: phone, address: address )
    
    model = Faker::Vehicle.model
    registration_plate = Faker::Vehicle.license_plate
    client_id = @client.id
    Vehicle.create!(model: model, registration_plate: registration_plate, client_id: client_id)
end



