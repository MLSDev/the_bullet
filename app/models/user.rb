class User < ApplicationRecord
  validates :email, presence: true

  validates :email, uniqueness: { case_sensitive: false }

  has_secure_password
end
