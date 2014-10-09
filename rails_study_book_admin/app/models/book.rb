class Book < ActiveRecord::Base
  scope :costly, -> { where("price > ?", 3000) }
end
