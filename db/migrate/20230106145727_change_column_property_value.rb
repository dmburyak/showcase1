class ChangeColumnPropertyValue < ActiveRecord::Migration[7.0]
  def change
    change_column :property_values, :property_data, :string
  end
end
