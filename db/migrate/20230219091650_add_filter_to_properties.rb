class AddFilterToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :filter, :integer, default: 0
  end
end
