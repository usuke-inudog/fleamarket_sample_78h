# 接続先情報
URL http://18.181.128.231/
## ID/Pass
ID: team78h
Pass: shibuya
## テスト用アカウント等
### 購入者用
メールアドレス: sample1@sample.com
パスワード: 0000000
購入用カード情報
番号： 4242424242424242
期限： 30/12
セキュリティコード：765
### 出品者用
メールアドレス名: sample2@sample.com
パスワード: 0000000


# Fleamarket DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null:false|
### Association
- has_one :profile
- has_one :credit_card
- has_many :items
- has_one :shipping_address
- has_many :comments

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|introduction|text||
|avatar|string||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false, unique: true|
|customer_id|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_family_name|string|null: false|
|shipping_first_name|string|null: false|
|shipping_family_name_kana|string|null: false|
|shipping_first_name_kana|string|null: false|
|postal_code|string(7)|null: false|
|state_province|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building_number|string||
|phone_number|string||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|category|references|null: false, foreign_key: true|
|item_condition|string|null: false|
|delivery_burden|string|null: false|
|delivery_method|string|null: false|
|shipper|string|null: false|
|shipping_day|string|null: false|
|size|string||
|seller|references|null: false, foreign_key: {to_table: :users}|
|buyer|references|foreign_key: {to_table: :users}|
|deal_close_date|timestamp||
### Association
- belongs_to :brand
- belongs_to :category
- belongs_to :user
- has_many :item_images
- has_many :comments

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|
#### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string|index: true|
<!-- ancestry使用 -->
### Association
- has_many :items
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
