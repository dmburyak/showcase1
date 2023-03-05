class PhonesRemoveDescriptionPrice < ActiveRecord::Migration[7.0]
  change_table :phones do | t |
    t.remove :description, :price
  end
end
