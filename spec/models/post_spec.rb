require "rails_helper"

RSpec.describe Post, type: :model do
  it "is valid with content and character" do
    user = User.create!(email: "u1@test.com", password: "123456")
    character = user.characters.create!(name: "Warrior")

    post = character.posts.build(content: "hello")

    expect(post).to be_valid
  end

  it "is invalid above 280 chars" do
    user = User.create!(email: "u2@test.com", password: "123456")
    character = user.characters.create!(name: "Mage")

    post = character.posts.build(content: "a" * 281)

    expect(post).not_to be_valid
  end
end
