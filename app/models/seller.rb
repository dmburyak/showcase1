class Seller < ApplicationRecord
  has_many :phones
  has_many :models

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end

end
