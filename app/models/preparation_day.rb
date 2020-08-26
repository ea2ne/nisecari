# activehash
class PreparationDay < ActiveHash::Base
  self.data = [
    {id: 0, day: '1〜2日で発送'},
    {id: 1, day: '2〜3日で発送'}, {id: 2, day: '4〜7日で発送'}
  ]

  include ActiveHash::Associations
  has_many :items
end