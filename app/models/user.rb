class User < ApplicationRecord
  before_save { self.email.downcase! }
  # relationship
  has_many :microposts

  # validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,
            presence: true,
            length: { maximum: 12, message: 'too long lah'}

  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  # hashing password
  has_secure_password
  validates :password,
            presence: true,
            length: { minimum: 4 }
end
