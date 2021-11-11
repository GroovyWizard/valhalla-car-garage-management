class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :title
      t.boolean :status
      t.date :estimative
      t.float :value
      t.timestamps
    end
  end
end
