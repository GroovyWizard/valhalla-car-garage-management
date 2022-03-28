class AddServiceAndSaleIdToPart < ActiveRecord::Migration[6.1]
  def change
    add_reference :parts, :sale
  end
end
