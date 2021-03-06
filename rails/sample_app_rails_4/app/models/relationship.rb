class Relationship < ActiveRecord::Base
  # foreign_keyを省略すると、Class名_idとなる。ここではuser_idとヒモ付ける
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
