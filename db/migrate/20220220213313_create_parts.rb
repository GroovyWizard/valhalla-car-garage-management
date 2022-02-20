class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|
      t.string :name
      t.float :value
      t.string :sold
      t.string :boolean

      t.timestamps
    end
  end
end
