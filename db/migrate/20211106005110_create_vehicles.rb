class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :model
      t.string :registration_plate

      t.timestamps
    end
  end
end
