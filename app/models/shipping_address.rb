class ShippingAddress < ApplicationRecord
  validates :shipping_family_name, :shipping_first_name, :shipping_family_name_kana, :shipping_first_name_kana,
            :postal_code, :state_province, :city, :street, :phone_number, presence: true

  validates :shipping_family_name, :shipping_first_name,
            format: { with: /^[一-龥ぁ-ん]/ }
            # 全角ひらがな、漢字

  validates :shipping_family_name_kana, :shipping_first_name_kana,
            format: { with: /^[ぁ-ん]+$/ }
            # 全角ひらがな
  
  validates :postal_code, length: { is: 7 }

  belongs_to :user

end
