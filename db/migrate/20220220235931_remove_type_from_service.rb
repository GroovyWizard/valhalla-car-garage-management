class RemoveTypeFromService < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :type, :string
  end
end
