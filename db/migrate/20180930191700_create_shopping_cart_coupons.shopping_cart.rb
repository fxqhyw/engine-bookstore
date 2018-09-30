# This migration comes from shopping_cart (originally 20180924105514)
class CreateShoppingCartCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :code
      t.decimal :discount

      t.timestamps
    end
  end
end
