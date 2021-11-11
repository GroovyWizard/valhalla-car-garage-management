class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_reference :vehicles, :client, index:true, foreign_key: true
  end
end
