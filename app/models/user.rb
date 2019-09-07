class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  before_validation { email.downcase! }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  has_many :posts
  has_one :profile
  has_many :favorites, dependent: :destroy
end
