class Profile < ApplicationRecord
  validates :family_name, :first_name, :family_name_kana, :first_name_kana,
            :birth_year, :birth_month, :birth_day, presence: true

  validates :family_name, :first_name,
            format: { with: /^[ぁ-んァ-ン一-龥]/, multiline: true }

  validates :family_name_kana, :first_name_kana,
            format: { with: /^[ぁ-ん]+$/, multiline: true }

  belongs_to :user

end
