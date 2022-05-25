class AddComissionValueToSale < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :comission_value, :decimal 
  end
end
