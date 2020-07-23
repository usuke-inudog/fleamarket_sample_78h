class AddItemToItemImage < ActiveRecord::Migration[6.0]
  def change
    add_reference :item_images, :item, null: false, foreign_key: true
  end
end
