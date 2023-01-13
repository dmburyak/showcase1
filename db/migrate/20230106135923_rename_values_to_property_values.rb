class RenameValuesToPropertyValues < ActiveRecord::Migration[7.0]
  def change
    drop_table(:values)
    create_table :property_values do |t|
      t.string :property_data
      t.references :property

      t.timestamps
    end
  end
end
