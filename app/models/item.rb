class Item < ApplicationRecord
  belongs_to :seller, optional: true
  has_and_belongs_to_many :property_values

  validates :name, presence: true
end
