# This migration comes from shopping_cart (originally 20180924105742)
class CreateShoppingCartDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_deliveries do |t|
      t.string :name
      t.decimal :price
      t.string :duration

      t.timestamps
    end
  end
end
