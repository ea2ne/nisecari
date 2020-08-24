FactoryBot.define do
  factory :item do  
    name                  {"tomato"}
    price                 {111}
    item_introduction     {"aaa"}
    item_condition_id     {2}
    postage_payer_id      {2}
    preparation_day_id    {2}
    prefecture_id         {2}
    brand              
    category             
    association :seller
    
  end
end