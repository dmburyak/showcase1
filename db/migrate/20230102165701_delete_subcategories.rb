class DeleteSubcategories < ActiveRecord::Migration[7.0]
  def change
    drop_table(:subcategories, cascade: true)
  end
end
