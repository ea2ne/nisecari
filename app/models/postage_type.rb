# activehash
class PostageType < ActiveHash::Base
  self.data = [
    {id: 0, type: '選択してください'}, {id: 1, type: '佐川急便'},
    {id: 2, type: 'クロネコヤマト便'}, {id: 3, type: '日本郵便'}
  ]

  include ActiveHash::Associations
  has_many :items
end