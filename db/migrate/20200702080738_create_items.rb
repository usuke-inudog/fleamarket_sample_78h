class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,            null: false
      t.text        :introduction,    null: false
      t.integer     :price,           null: false
      t.references  :brand,           foreign_key: true
      t.references  :category,        null: false, foreign_key: true
      t.string      :item_condition,  null: false
      t.string      :delivery_burden, null: false
      t.string      :delivery_method, null: false
      t.string      :shipper,         null: false
      t.string      :shipping_day,    null: false
      t.string      :size
      t.references  :seller,          null: false, foreign_key: {to_table: :users}
      t.references  :buyer,           foreign_key: {to_table: :users}
      t.timestamp   :deal_close_date
      t.timestamps
    end
  end
end
