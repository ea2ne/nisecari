class ItemImage < ApplicationRecord
  mount_uploader :url, ImageUploader
  belongs_to :item
  # mount_uploader :image, ImageUploader
#   validates :url, length: { minimum: 1, maximum: 10 }, presence: true
end
