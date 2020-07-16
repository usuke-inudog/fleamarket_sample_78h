class ChangeDatatypePostalCodeOfShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :shipping_addresses, :postal_code, :string
  end
end
