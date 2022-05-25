class ChangeSaleValueToDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :sales, :value, :decimal, :precision => 3, :scale => 2
  end
end
