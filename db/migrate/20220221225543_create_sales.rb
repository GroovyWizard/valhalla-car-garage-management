class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :name
      t.string :description
      t.float :value

      t.timestamps
    end
  end
end
