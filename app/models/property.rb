class Property < ApplicationRecord
  has_many :property_values
  belongs_to :property_group
end
