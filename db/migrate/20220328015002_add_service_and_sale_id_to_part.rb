class AddServiceAndSaleIdToPart < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :sale_id, :integer
    add_column :parts, :service_id, :integer
  end
end
