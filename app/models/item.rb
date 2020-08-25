class Item < ApplicationRecord

  has_many :item_images, dependent: :destroy
  has_many :comments
  belongs_to :category
  belongs_to :user, optional:true

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  validates :item_introduction, length: {maximum: 1000}, presence: true
  validates :name, length: {maximum: 40}, presence: true
  validates :price, presence: true
  # validates :item_condition_id, :postage_payer, :prefecture, :preparation_day, numericality: { greater_than: 0 }
  accepts_nested_attributes_for :item_images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture
end
