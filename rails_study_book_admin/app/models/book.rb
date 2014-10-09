class Book < ActiveRecord::Base
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

end

