class Seller < ApplicationRecord
  has_many :phones

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end

end
