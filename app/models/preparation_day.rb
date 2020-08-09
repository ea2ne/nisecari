# activehash
class PreparationDay < ActiveHash::Base
  self.data = [
    {id: 0, day: '選択してください'}, {id: 1, day: '1〜２日で発送'},
    {id: 2, day: '2〜3日で発送'}, {id: 3, day: '4〜7日で発送'}
  ]

  include ActiveHash::Associations
  has_many :items
end