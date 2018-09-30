class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_many :order_items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  belongs_to :category, counter_cache: true

  validates :title, :description, :price, :published_at, :materials, :height, :width, :depth, :quantity, presence: true
  validates :price, :height, :width, :depth, :quantity, numericality: { greater_than_or_equal_to: 0.01 }
  validates :published_at, numericality: { less_than_or_equal_to: Time.current.year }
  validate :correct_images_type

  scope :latest, -> { order(created_at: :desc).limit(3) }

  def self.best_sellers
    array_of_books = Book.find_by_sql("SELECT books.*, SUM(shopping_cart_order_items.quantity) AS sum_items
      FROM books
      INNER JOIN shopping_cart_order_items ON shopping_cart_order_items.product_id = books.id
      GROUP BY books.id
      ORDER BY sum_items DESC
      LIMIT 4")
    Book.where(id: array_of_books.map(&:id))
  end

  private

  def correct_images_type
    return unless images.attached?

    images.each do |image|
      errors.add(:images, 'must be a JPEG or PNG') unless image.content_type.in?(%w[image/jpeg image/png])
    end
  end
end
