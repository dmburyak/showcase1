class PropertyValue < ApplicationRecord
  belongs_to :property
  has_and_belongs_to_many :items
end
