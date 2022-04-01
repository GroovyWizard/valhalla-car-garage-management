class AddServiceReferenceToSale < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :service
  end
end
