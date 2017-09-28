require "rails_helper"

RSpec.feature 'Todo complete', :type => :feature do
  scenario "User can complete a todo" do
    user = User.create!(username: 'user', password: 'password', email: 'email@example.com')
    todo = Todo.create!(title: "call walid once more", description: "need phone", due_date: Time.now, user: user)

    visit login_path
    fill_in "username", with: "user"
    fill_in "password", with: "password"

    click_button "Loggin in in"

    expect(page).to have_content 'call walid once more'

    click_link 'call walid once more'
    expect(todo.reload.completed).to eq(true)
  end
end
