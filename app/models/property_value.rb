class PropertyValue < ApplicationRecord
  belongs_to :property
  has_and_belongs_to_many :phones

  validates :property_data, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['property_data']
  end

end
