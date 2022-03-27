class AddStockToParts < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :stock, :integer
  end
end
