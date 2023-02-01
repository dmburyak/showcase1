class AddKeyFeaturesToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :key_feature, :boolean, default: false
  end
end
