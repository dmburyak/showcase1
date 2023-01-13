class AddMainAndOrderToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :main, :boolean
    add_column :properties, :order, :integer
    add_reference :properties, :property_group
  end
end
