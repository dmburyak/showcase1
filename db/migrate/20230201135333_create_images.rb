class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.text :url
      t.integer :order
      t.belongs_to :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
