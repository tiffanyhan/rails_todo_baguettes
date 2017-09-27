class Category < ActiveRecord::Base
  has_many :todos
  belongs_to :user

  validates :name, presence: :true, uniqueness: true
end