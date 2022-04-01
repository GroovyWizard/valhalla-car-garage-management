class RemoveStockFromParts < ActiveRecord::Migration[6.1]
  def change
    remove_column :parts, :stock, :integer
  end
end
