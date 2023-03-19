class RenamePropertiesOrderToPriority < ActiveRecord::Migration[7.0]
  change_table :properties do |t|
    t.rename :order, :priority
  end
end

