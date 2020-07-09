class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_burden
  belongs_to :delivery_method
  belongs_to :shipper
  belongs_to :shipping_day
  belongs_to :size
  has_many   :item_images, dependent: :destroy
  accepts_nested_attributes_for :itme_images, allow_destroy: true
  belongs_to :seller, class_name:"User", optional: true, foreign_key: "seller_id"
  belongs_to :buyer, class_name:"User", optional: true, foreign_key: "buyer_id"
end
