class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :username,
    presence: true,
    uniqueness: true
  validates :email,
    presence: true,
    uniqueness: true
  validates :password,
    presence: true,
    length: { minimum: 6 }, if: -> { new_record? || changes["password"] }
end
