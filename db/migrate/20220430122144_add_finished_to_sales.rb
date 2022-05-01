class AddFinishedToSales < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :finished, :boolean  
  end
end
