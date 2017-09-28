require "rails_helper"

RSpec.describe Todo, :type => :model do
  describe '#title_digest' do
    it "return title if title is less than or equal to 10 characters" do
      user = User.create!(username: 'user', password: 'password', email: 'email@example.com')
      todo = Todo.create!(title: "call", description: "need phone", due_date: Time.now, user: user)

      expect(todo.title_digest).to eq('call')
    end

    it "return first 10 characters plus '...' of title if title is longer than 10 characters" do
      user = User.create!(username: 'user', password: 'password', email: 'email@example.com')
      todo = Todo.create!(title: "call walid again and again", description: "need phone", due_date: Time.now, user: user)

      expect(todo.title_digest).to eq('call walid...')
    end
  end

  describe '.due_within_next_24_hours' do
    it "returns todos due within the next 24 hours" do
      user = User.create!(username: 'user', password: 'password', email: 'email@example.com')
      todo1 = Todo.create!(title: "call walid", description: "need phone", due_date: Time.now, user: user)
      todo2 = Todo.create!(title: "call jay", description: "need phone", due_date: Time.now + 1.hour, user: user)
      todo3 = Todo.create!(title: "call tiff", description: "need phone", due_date: Time.now + 2.hours, user: user)
      todo4 = Todo.create!(title: "call kevin", description: "need phone", due_date: 1.day.ago, user: user)

      expect(Todo.due_within_next_24_hours.sort { |todo| todo.due_date }).to eq([todo2, todo3].sort { |todo| todo.due_date })
    end
  end
end
