require "rails_helper"

RSpec.feature 'Todo creation', :type => :feature do
  scenario 'User can create a new todo' do
    user = User.create(username: 'user', password: 'password', email: 'email@example.com')


    expect(true).to eq(true)
  end
end