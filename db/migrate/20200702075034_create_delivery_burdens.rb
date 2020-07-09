class CreateDeliveryBurdens < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_burdens do |t|
      t.string    :burden
      t.timestamps
    end
  end
end
