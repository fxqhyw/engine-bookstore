# This migration comes from shopping_cart (originally 20180924113942)
class CreateShoppingCartBillingAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_billing_addresses do |t|

      t.timestamps
    end
  end
end
