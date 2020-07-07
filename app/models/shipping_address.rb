class ShippingAddress < ApplicationRecord
  validates :shipping_family_name, :shipping_first_name, :shipping_family_name_kana, :shipping_first_name_kana,
            :postal_code, :state_province, :city, :street, :phone_number, presence: true

  validates :shipping_family_name, :shipping_first_name,
            format: { with: /^[ぁ-んァ-ン一-龥]/, multiline: true }

  validates :shipping_family_name_kana, :shipping_first_name_kana,
            format: { with: /^[ぁ-ん]+$/, multiline: true }
  
  validates :postal_code, length: { is: 7 }

  belongs_to :user

end
