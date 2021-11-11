class AddForeignKeyToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :service, index:true
  end
end
