class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :shipping_family_name,         null: false
      t.string :shipping_first_name,          null: false
      t.string :shipping_family_name_kana,    null: false
      t.string :shipping_first_name_kana,     null: false
      t.integer :postal_code,                 null: false
      t.string :state_province,               null: false
      t.string :city,                         null: false
      t.string :street,                       null: false
      t.string :building_number
      t.string :phone_number,                 null: false
      t.references :user,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
