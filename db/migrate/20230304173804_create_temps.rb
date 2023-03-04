class CreateTemps < ActiveRecord::Migration[7.0]
  def change
    create_table :temps do |t|
      t.text :text

      t.timestamps
    end
  end
end
