# This migration comes from shopping_cart (originally 20180924114007)
class CreateShoppingCartShippingAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_shipping_addresses do |t|

      t.timestamps
    end
  end
end
