Item.seed do |s|
  s.id = 1
  s.name = "植木"
  s.price = 3000
  s.trading_status = "配送中"
  s.deal_closed_date = "2020/8/11"
  s.seller_id = 1
  s.buyer_id = 2
end

Item.seed do |s|
  s.id = 2
  s.name = "家常"
  s.price = 5000
  s.trading_status = "配送中"
  s.deal_closed_date = "2020/8/12"
  s.seller_id = 2
  s.buyer_id = 5
end

Item.seed do |s|
  s.id = 3
  s.name = "王"
  s.price = 5000
  s.trading_status = "配送中"
  s.deal_closed_date = "2020/8/13"
  s.seller_id = 3
  s.buyer_id = 4
end