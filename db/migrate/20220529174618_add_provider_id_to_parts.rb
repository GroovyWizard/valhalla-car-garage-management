class AddProviderIdToParts < ActiveRecord::Migration[6.1]
  def change
    add_reference :parts, :provider, index:true
  end
end
