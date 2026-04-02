require "rails_helper"

RSpec.describe "Posts", type: :request do
  it "requires authentication" do
    post posts_path, params: { post: { content: "Nope" } }

    expect(response).to redirect_to(new_user_session_path)
  end

  it "cannot create without selected character" do
    user = User.create!(email: "poster@test.com", password: "123456")
    sign_in user

    post posts_path, params: { post: { content: "No character" } }

    expect(response).to redirect_to(feed_path)
    follow_redirect!
    expect(response.body).to include("Select a character")
  end
end
