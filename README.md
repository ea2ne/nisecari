# README
# nisecari
- フリマアプリのクローンサイトです
- TECH::CAMP 80期短期集中コースEチームで作成
- 作成期間 2020/8/04〜2020/8/28
![2020-8-28](https://i.gyazo.com/3fe8a52593cb8d1c9c3ee4f654aab66f.jpg)
# 主な使用言語
- ruby
- ruby on rails
- Haml
- scss
- jquery
- aws
# 機能紹介
- 新規会員登録・ログインをすると商品の購入、出品ができます
- 新規会員登録、ログインがお済みでない方も商品の一覧、詳細を閲覧可能です
- 決済方法はご自身のクレジットカードを登録して購入できます
- ヘッダーの検索フォームから、商品の検索も可能です
# サイトURL紹介
- ユーザー名:o80e
- パスワード:o80e
- IPアドレス:18.181.134.233
# インストール方法
1. このリポジトリを複製
  $ git clone https://github.com/ea2ne/nisecari.git
1. インストールしたリポジトリに移動
  $ cd nisecari
1. gemをアプリケーションに適用
  $ bundle install
1. DBの作成＆反映
  $ rails db:create
  $ rails db:migrate
1. カテゴリー一覧の反映
  $ rails db:seed
1. アプリケーションの起動
  $ rails s
  http://localhost:3000
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, default: ""|
|email|string|null: false, default: ""|
|reset_password_token|string||
|reset_password_sent_at|datetime||
|remember_created_at|datetime||
### Association
- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- devise :validatable, password_length: 7..128
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :selling_items, -> { where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL")}, foreign_key: "seller_id", class_name: "Item"
- has_many :comments
- has_many :items, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :item_favorites, through: :favorites,source: :item

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|introduction|text|null: false|
|avatar|string|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|phone_number|integer||
|user_id|references|null: false, foreign_key: true|
|roomnumber|string||
### Association
- belongs_to :user, optional: true
- belongs_to_active_hash :prefecture

## credit_cards(Pay.jp)テーブル
|Column|Type|Options|
|------|----|-------|
|curd_number|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_introduction|text|null: false|
|price|integer|null: false|
|brand|string|
|item_condition_id|integer|null: false|
|postage_payer_id|integer|null: false|
|preparation_day_id|integer|null: false|
|prefecture_id|integer|null: false|
|category_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
### Association
- has_many :item_images, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :user_favorites, through: :favorites, source: :user
- belongs_to :category
- belongs_to :user, optional: true
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User”, optional: true
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :prefecture

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item-id|references|null: false, foreign_key: true|
|url|string|null: false|
### Association
- belongs_to :item

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items
- has_ancestry