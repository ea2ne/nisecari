class SendingDestination < ApplicationRecord
  belongs_to :user, optional: true
  validates :destination_first_name, :destination_family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :destination_first_name_kana, :destination_family_name_kana, presence: true, format: { with: /\A[ぁ-ん]+\z/ }
  validates :post_code, :prefecture_code, :city, :house_number, presence: true
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
