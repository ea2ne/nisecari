crumb :root do
  link "top", root_path
end

crumb :mypage do
  link "マイページ",  profiles_path
  parent :root
end

crumb :buy do
  link "購入",  buy_item_path
  parent :root
end

crumb :edit do
  link "編集",  edit_item_path
  parent :root
end

crumb :index do
  link "一覧",  items_path
  parent :root
end
crumb :show do
  link "詳細",  item_path
  parent :root
end

