# frozen_string_literal: true
class Property < ApplicationRecord
  has_many :property_values
  belongs_to :property_group

  validates :name, :order, presence: true

  scope :key_features, lambda {
    where(key_feature: true)
      .order(:order)
  }

  scope :non_key_features, lambda {
    where(key_feature: false)
      .order(:order)
  }

  scope :non_key_features_part1, lambda {
    where(key_feature: false, priority: [1...230])
      .order(:priority)
  }

  scope :non_key_features_part2, lambda {
    where(key_feature: false, priority: [230..])
      .order(:priority)
  }

end
