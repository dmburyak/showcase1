class AddCategoryToProperties < ActiveRecord::Migration[7.0]
  def change
    add_reference :properties, :category
  end
end
