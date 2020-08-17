class Prefecture < ActiveHash::Base
  self.data = [
    {id: 0, name: '選択してください'}, {id: 1, name: '北海道'},
    {id: 2, name: '青森県'}, {id: 3, name: '岩手県'}
  ]

  include ActiveHash::Associations
  has_many :items
end