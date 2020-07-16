class ShippingAddressController < ApplicationController
  
  
  def new
    if current_user.shipping_address.present?
      redirect_to edit_shipping_address_path(current_user.id)
    else
      
    end
  end

  def edit
  end
end
