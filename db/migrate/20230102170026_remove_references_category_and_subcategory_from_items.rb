class RemoveReferencesCategoryAndSubcategoryFromItems < ActiveRecord::Migration[7.0]

  remove_columns(:items, :category_id, :subcategory_id)
  
end