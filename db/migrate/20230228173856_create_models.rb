class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.string :name
      t.string :brand
      t.string :base_url
      t.text :model_url
      t.belongs_to :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
