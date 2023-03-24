class User < ApplicationRecord
  before_save :email.downcase
  has_secure_password
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6 }
end
