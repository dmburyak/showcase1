class DeleteCategoryFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_columns(:properties, :category_id)
  end
end
