class RemoveProviderNameFromParts < ActiveRecord::Migration[6.1]
  def change
    remove_column :parts, :provider_name, :string
  end
end
