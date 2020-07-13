class ItemImage < ApplicationRecord
  belongs_to :item

  # mount_uploader :image, ImageUploader
  mount_uploaders :image, ImageUploader
  validates :image, presence: true
end
