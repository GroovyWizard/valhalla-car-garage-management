class AddTypeToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :type, :integer, default: 0 
  end
end
