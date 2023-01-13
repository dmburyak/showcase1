class Property < ApplicationRecord
  has_many :values
  belongs_to :property_group
end
