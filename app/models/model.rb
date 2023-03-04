class Model < ApplicationRecord
  belongs_to :seller
  has_many :variants
end
