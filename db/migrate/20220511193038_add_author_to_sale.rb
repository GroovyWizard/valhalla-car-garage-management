class AddAuthorToSale < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :user
  end
end
