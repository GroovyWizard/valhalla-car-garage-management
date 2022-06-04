class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :cnpj
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
