class User < ActiveRecord::Base
  has_secure_password

  has_many :todos
  has_many :categories

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :email, presence: true
end