FactoryBot.define do
  factory :item do  
    name                  {"tomato"}
    price                 {111}
    item_introduction     {"aaa"}
    brand
    category
    item_condition_id     {1}
    postage_payer_id      {1}
    preparation_day_id    {1}
    prefecture_id         {1}
    association :seller
  end
end