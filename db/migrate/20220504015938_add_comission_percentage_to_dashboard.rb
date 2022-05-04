class AddComissionPercentageToDashboard < ActiveRecord::Migration[6.1]
  def change
    add_column :dashboards, :comission_percentage, :decimal
  end
end
