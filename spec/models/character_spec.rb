require "rails_helper"

RSpec.describe Character, type: :model do
  it "belongs to user" do
    user = User.create!(email: "owner@test.com", password: "123456")
    character = user.characters.create!(name: "Rogue")

    expect(character.user).to eq(user)
  end

  it "enforces max 5 characters" do
    user = User.create!(email: "max@test.com", password: "123456")
    5.times { |i| user.characters.create!(name: "C#{i}") }

    extra = user.characters.build(name: "Overflow")

    expect(extra).not_to be_valid
  end
end
