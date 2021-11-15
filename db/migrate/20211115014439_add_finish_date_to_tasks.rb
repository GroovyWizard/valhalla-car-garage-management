class AddFinishDateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :finish_date, :date
  end
end
