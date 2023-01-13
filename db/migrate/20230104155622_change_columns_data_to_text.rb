class ChangeColumnsDataToText < ActiveRecord::Migration[7.0]
  def change
    change_column :values, :data, :text
  end
end
