# frozen_string_literal: true
class Property < ApplicationRecord
  has_many :property_values
  belongs_to :property_group

  validates :name, :order, presence: true

  scope :key_features, lambda {
    includes(:property_group)
      .where(property_groups: { name: 'Key Features' })
      .order(:order)
  }

end
