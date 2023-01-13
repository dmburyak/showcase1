class CreateItemsAndValues < ActiveRecord::Migration[7.0]
  def change
    create_table :items_values, id: false do |t|
      t.belongs_to :item
      t.belongs_to :value
      t.timestamps
    end
  end
end
