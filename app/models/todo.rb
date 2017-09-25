class Todo < ActiveRecord::Base
  validates :title, presence: true
  validates :due_date, presence: true
end