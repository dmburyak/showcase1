class PropertyGroup < ApplicationRecord
  has_many :properties

  validates :name, :order, presence: true
end
