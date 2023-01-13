class DeleteCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table(:categories, cascade: true)
  end
end
