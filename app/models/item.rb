class Item < ApplicationRecord
  belongs_to :seller, optional: true
  has_and_belongs_to_many :property_values
  has_many :images

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
