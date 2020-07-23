class CreateItemImages < ActiveRecord::Migration[6.0]
  def change
    create_table :item_images do |t|
      t.string      :image,     null: false
      t.timestamps
    end
  end
end
