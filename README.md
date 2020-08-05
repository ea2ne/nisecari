# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false, unique: true, index: true|
### Association
- has_one :profile, dependent: :destroy
- has_one :credit_card, dependent: destroy
- has_one :sending_destination,  dependent: :destroy
- has_many_seller_items, foreign_key:"seller_id", class_name: "items"
- has_many_buyer_items, foreign_key:"buyer_id", class_name:"items"

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name|string|null: false|
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
|phone_number|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- Gem jp_prefectureを使用して都道府県コードを取得

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
|introduction|text|null: false|
|price|integer|null: false|
|trading_status|enum|null: false|
|deal_closed_date|timestamp|
|category_id|references|foreign_key: true|
|size_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
### Association
- has_many :item-images, dependent: :destroy
- belongs_to :category
- belongs_to :size
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: ""User

## item-imagesテーブル
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

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## preparation_days
|Column|Type|Options|
|------|----|-------|
|preparation_day|string|null: false|
### Association
- has_many :items
