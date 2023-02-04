class Image < ApplicationRecord
  belongs_to :phone

  validates :url, :order, presence: true
end
