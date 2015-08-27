class Book < ActiveRecord::Base
  enum status: %w(reservation now_on_sale end_of_price)
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ?","%#{theme}%") }

  # Bookから見ればPublisherは一意に決まる
  belongs_to :publisher

  # Bookから見てAuthorは多であり、BookAuthorsを挟んで参照する
  has_many :book_authors
  has_many :authers, through: :book_authors

  # バリデーション
  validates :name, presence: true
  validates :name, length: { maximum:15 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # コールバック
  before_validation do |book|
    book.name = book.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

end

