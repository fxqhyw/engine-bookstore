FactoryBot.define do
  factory :order_item, class: 'ShoppingCart::OrderItem' do
    product { create(:book) }
    quantity { 1 }
    order
  end
end
