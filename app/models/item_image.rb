class ItemImage < ApplicationRecord
  mount_uploader :url, ImageUploader
  belongs_to :item
  # mount_uploader :image, ImageUploader

end
