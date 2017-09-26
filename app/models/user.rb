class User < ActiveRecord::Base
  has_many :todos
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
end