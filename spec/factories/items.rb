FactoryBot.define do

  factory :item do  
    name                  {"tomato"}
    price                 {111}
    item_introduction     {"aaa"}
    user
    brand
    category
    item_condition
    postage_payer
    postage_type
    preparation_day
  end

end