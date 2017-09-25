class Todo < ActiveRecord::Base
  validates :title, presence: true
  validates :due_date, presence: true
  validates :description, presence: true
end