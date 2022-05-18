class ChangeSaleComissionValueToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :sales, :comission_value, :float
  end
end
