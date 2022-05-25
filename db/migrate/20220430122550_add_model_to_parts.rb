class AddModelToParts < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :model, :string
  end
end
