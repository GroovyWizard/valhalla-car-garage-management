class AddProviderNameToPart < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :provider_name, :string
  end
end
