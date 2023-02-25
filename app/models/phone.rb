class Phone < ApplicationRecord
  belongs_to :seller, optional: true
  has_and_belongs_to_many :property_values
  has_many :images

  # ransack_alias :phone, :name_or_description_or_property_values_property_data

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.ransackable_attributes(auth_object = nil)
    %w[description name price]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[property_values seller]
  end

end
