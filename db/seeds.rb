require 'ffaker'

AdminUser.create!(email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678')

Category.create([{ title: 'Mobile Development' }, { title: 'Web Design' }, { title: 'Photo' }, { title: 'Web Development' }])
materials = ['paper, brick, hardcove', 'paper stocks, glossym', 'lace, slate, sand', 'lace, man-made fibres']

Category.find_each do |category|
  rand(13..25).times do
    book = Book.create(title: FFaker::Book.title,
                       description: FFaker::Lorem.paragraph,
                       published_at: rand(1999..2018),
                       price: rand(21.99..49.99),
                       materials: materials[rand(0..3)],
                       quantity: 100,
                       height: rand(6.9..9.9),
                       width: rand(5.1..9.9),
                       depth: rand(0.6..1.1),
                       category_id: category.id)
    rand(1..2).times { book.authors << Author.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name) }
  end
end

ShoppingCart::Coupon.create(code: 'BOOKER', discount: 5.00)
ShoppingCart::Coupon.create(code: 'LIBRARIAN', discount: 10.00)

ShoppingCart::Delivery.create(name: 'Delivery Next Day!', duration: '1 day', price: 10)
ShoppingCart::Delivery.create(name: 'Express', duration: '2 to 5 days', price: 5)
ShoppingCart::Delivery.create(name: 'By train', duration: '3 to 7 days', price: 1)
