require "rails_helper"

RSpec.feature 'Todo creation', :type => :feature do
  scenario 'User can create a new todo' do
    user = User.create(username: 'user', password: 'password', email: 'email@example.com')

    visit login_path
    fill_in "username", with: "user"
    fill_in "password", with: "password"

    click_button "Loggin in in"

    click_link "create todo"

    fill_in "Title", with: "call jay again"
    fill_in "Description", with: "jay had baguette questions"
    click_on "Create Todo"

    expect(page).to have_content 'call jay again'
  end

  scenario "User has to be logged in to create a new todo" do
    user = User.create(username: 'user', password: 'password', email: 'email@example.com')

    visit new_todo_path

    expect(page).to have_content 'You must be logged in to do that.'
  end
end