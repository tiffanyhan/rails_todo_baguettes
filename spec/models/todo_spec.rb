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
end
