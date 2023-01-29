class PropertyValue < ApplicationRecord
  belongs_to :property
  has_and_belongs_to_many :items

  validates :property_data, presence: true

  def set_value_with_link
    @aaa
  end

end
