class AddPublishToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :publish, :boolean
  end
end
