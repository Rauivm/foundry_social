class FeedController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.includes(:character).order(created_at: :desc).limit(50)
    @characters = current_user.characters.order(created_at: :asc)
  end
end
