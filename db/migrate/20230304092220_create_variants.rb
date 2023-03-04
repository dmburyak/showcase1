class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :name
      t.string :color
      t.string :storage
      t.belongs_to :model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
