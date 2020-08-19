class Item < ApplicationRecord
  has_many :item_images
  
  belongs_to :category, optional:true
  belongs_to :user, foreign_key: 'user_id', optional:true
  

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :brand
  validates :item_introduction, length: {maximum: 1000}, presence: true
  validates :name, length: {maximum: 40}, presence: true
  validates :item_condition, :postage_payer, :prefecture, :preparation_day, :price, presence: true
  accepts_nested_attributes_for :item_images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture
end
