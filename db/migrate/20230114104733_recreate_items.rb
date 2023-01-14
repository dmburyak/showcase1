class RecreateItems < ActiveRecord::Migration[7.0]
  def change
    drop_table(:items)
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.text :url
      t.references :seller

      t.timestamps
    end
  end
end
