class Micropost < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :user
  default_scope -> { order('created_at DESC') }
end

