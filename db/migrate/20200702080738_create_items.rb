class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,            null: false
      t.text        :introduction,    null: false
      t.integer     :price,           null: false
      t.references  :brand,           foreign_key: true
      t.references  :category,        null: false, foreign_key: true
      t.references  :item_condition,  null: false, foreign_key: true
      t.references  :delivery_burden, null: false, foreign_key: true
      t.references  :delivery_method, null: false, foreign_key: true
      t.references  :shipper,         null: false, foreign_key: true
      t.references  :shipping_day,    null: false, foreign_key: true
      t.references  :size,            null: false, foreign_key: true
      t.references  :seller,          null: false, foreign_key: {to_table: :users}
      t.references  :buyler,          foreign_key: {to_table: :users}
      t.timestamp   :deal_close_date
      t.timestamps
    end
  end
end
