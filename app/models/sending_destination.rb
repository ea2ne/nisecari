class SendingDestination < ApplicationRecord
  belongs_to :user
  validates :post_code, :prefecture
end
