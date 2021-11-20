require "test_helper"

class ClientTest < ActiveSupport::TestCase

  def client_creator(@name, @document, @phone, @address) 
    Client.new(name: @name, document: @document, phone: @phone, address: @address)
  end

  

end
