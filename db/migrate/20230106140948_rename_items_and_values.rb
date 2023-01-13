class RenameItemsAndValues < ActiveRecord::Migration[7.0]
  def change
    drop_table(:items_values)
    end
  end
end
