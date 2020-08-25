class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ぁ-ん]+\z/ }
  validates :birth_day, :introduction, presence: true
end
