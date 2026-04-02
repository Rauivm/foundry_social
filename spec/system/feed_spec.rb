require "rails_helper"

RSpec.describe "Feed", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows logged-in user to post" do
    user = User.create!(email: "sys@test.com", password: "123456")
    user.characters.create!(name: "Knight")

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "123456"
    click_button "Log in"

    fill_in "post_content", with: "Hello world"
    click_button "Post"

    expect(page).to have_text("Hello world")
  end
end
