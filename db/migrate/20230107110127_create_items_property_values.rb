class CreateItemsPropertyValues < ActiveRecord::Migration[7.0]
  def change
    create_table :items_property_values, id: false do |t|
      t.belongs_to :item
      t.belongs_to :property_value
      t.timestamps
    end
  end
end
