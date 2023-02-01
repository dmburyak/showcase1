class RemoveColumnMainFromPropertyGroups < ActiveRecord::Migration[7.0]

  def change
    remove_column :property_groups, :main
  end

end
