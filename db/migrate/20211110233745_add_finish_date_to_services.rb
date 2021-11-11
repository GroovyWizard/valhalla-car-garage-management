class AddFinishDateToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :finish_date, :date
  end
end
