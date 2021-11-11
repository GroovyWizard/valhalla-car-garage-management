class AddForeignKeyToServices < ActiveRecord::Migration[6.1]
  def change
    add_reference :services, :vehicle, index:true
  end
end
