class CreatePropertyGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :property_groups do |t|
      t.string  :name
      t.boolean :main
      t.integer :order

      t.timestamps
    end
  end
end
