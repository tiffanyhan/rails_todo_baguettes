class Todo < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  validates :due_date, presence: true
  validates :description, presence: true
end