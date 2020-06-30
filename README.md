# Fleamarket DB設計


## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null:false|
### Association
- belongs_to :profile
- belongs_to :credit_card
- has_many :items
- belongs_to :shipping_address


## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|introduction|text||
|avatar|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|card_name|string|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## Shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_family_name|string|null: false|
|shipping_first_name|string|null: false|
|shipping_family_name_kana|string|null: false|
|shipping_first_name_kana|string|null: false|
|postal_code|integer|null: false|
|state_province|string|null: false|
|city|string|null: false|
|street|string|null: false|
|other|string||
|phone_number|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand_id|references|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|delivery_burden_id|references|null: false, foreign_key: true|
|delivery_method_id|references||
|shippers_id|references|null: false, foreign_key: true|
|shipping_day_id|references|null: false, foreign_key: true|
|size_id|references||
|seller (current_user_id)|references|null: false, foreign_key: true|
|buyer (current_user_id)|references|null: false, foreign_key: true|
|deal_closed_date|timestamp||
### Association
- belongs_to :brand
- belongs_to :category
- belongs_to :item_condition
- belongs_to :delivery_burden
- belongs_to :delivery_method
- belongs_to :shipper
- belongs_to :shipping_day
- belongs_to :size
- belongs_to :user
- has_many :item_images


## Items_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|
#### Association
- belongs_to :item



## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry
<!-- ancestry使用 -->
### Association
- has_many :items


## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items


## Item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string||
### Association
- has_many :items


## Delivery_burdensテーブル
|Column|Type|Options|
|------|----|-------|
|burden|string||
### Association
- has_many :items


## Shippersテーブル
|Column|Type|Options|
|------|----|-------|
|shipper|string||
### Association
- has_many :items


## Shipping_daysテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_day|string||
### Association
- has_many :items


## Sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string||
### Association
- has_many :items

