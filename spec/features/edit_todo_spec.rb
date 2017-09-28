require "rails_helper"

RSpec.feature 'Todo edit', :type => :feature do
  scenario "User can edit an existing todo" do
    user = User.create!(username: 'user', password: 'password', email: 'email@example.com')
    todo = Todo.create!(title: "call walid once more", description: "need phone", due_date: Time.now, user: user)

    visit login_path
    fill_in "username", with: "user"
    fill_in "password", with: "password"

    click_button "Loggin in in"

    expect(page).to have_content 'call walid once more'

    click_link 'edit'

    fill_in "Title", with: "call tiffany once more"
    click_button "Update Todo"

    expect(page).to have_content 'call tiffany once more'
  end
end
