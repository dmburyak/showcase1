class RemoveMainFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :main
  end
end
