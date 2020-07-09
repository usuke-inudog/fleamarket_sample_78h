# Fleamarket DB設計


## Usersテーブル
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


## Profilesテーブル
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


## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false, unique: true|
|customer_id|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## Shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_family_name|string|null: false|
|shipping_first_name|string|null: false|
|shipping_family_name_kana|string|null: false|
|shipping_first_name_kana|string|null: false|
|postal_code|integer(7)|null: false|
|state_province|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building_number|string||
|phone_number|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|category|references|null: false, foreign_key: true|
|item_condition|references|null: false, foreign_key: true|
|delivery_burden|references|null: false, foreign_key: true|
|delivery_method|references|null: false, foreign_key: true|
|shippers|references|null: false, foreign_key: true|
|shipping_day|references|null: false, foreign_key: true|
|size|references|null: false, foreign_key: true|
|seller|references|null: false, foreign_key: {to_table: :users}|
|buyer|references|foreign_key: {to_table: :users}|
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


## Item_imagesテーブル
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
|ancestry|||
<!-- ancestry使用 -->
### Association
- has_many :items
- has_ancestry


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


## Delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|method|string||
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

