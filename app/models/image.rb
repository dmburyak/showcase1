class Image < ApplicationRecord
  belongs_to :item

  validates :url, :order, presence: true
end
