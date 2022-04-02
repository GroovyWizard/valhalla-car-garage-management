class CreateSalePartsTable < ActiveRecord::Migration[6.1]
  def change
      create_table :sale_parts do |t|
        t.belongs_to :sale
        t.belongs_to :part 
        t.float :part_value
        t.timestamps
      end
    end
end
