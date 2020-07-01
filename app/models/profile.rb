class Profile < ApplicationRecord
  validates :family_name, :first_name, :family_name_kana, :first_name_kana,
            :birth_year, :birth_month, :birth_day, presence: true

  validates :family_name, :first_name,
            format: { with: /^[一-龥ぁ-ん]/ }
            # 全角ひらがな、漢字

  validates :family_name_kana, :first_name_kana,
            format: { with: /^[ぁ-ん]+$/ }
            # 全角ひらがな

  belongs_to :user

end
