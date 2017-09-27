class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :due_date, presence: true
  validates :description, presence: true
end