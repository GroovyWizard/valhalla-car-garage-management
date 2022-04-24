class RemoveSoldFromParts < ActiveRecord::Migration[6.1]
  def change
    remove_column :parts, :sold, :boolean
  end
end
