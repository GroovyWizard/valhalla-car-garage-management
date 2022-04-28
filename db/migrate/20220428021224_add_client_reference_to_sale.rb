class AddClientReferenceToSale < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :client
  end
end
