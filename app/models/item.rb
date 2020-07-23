class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :brand
  belongs_to :category
  has_many   :item_images, dependent: :destroy
  belongs_to :seller, class_name:"User", optional: true, foreign_key: "seller_id"
  belongs_to :buyer, class_name:"User", optional: true, foreign_key: "buyer_id"
  has_many :comments

  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true
  validates :name,          presence: true, length: { maximum: 40 } 
  validates :introduction,  presence: true, length: { maximum: 1000 }
  validates :category_id,   presence: true
  validates :item_condition,  presence: true
  validates :delivery_burden, presence: true
  validates :delivery_method, presence: true
  validates :shipper,         presence: true
  validates :shipping_day,    presence: true
  validates_associated :item_images
  validates :item_images,        presence: true
  validates :price,           presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
