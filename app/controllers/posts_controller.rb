class PostsController < ApplicationController
  def create
    result = Posts::Create.call(user: current_user, character: current_character, content: post_params[:content])

    @post = result.post

    if result.success?
      respond_to do |format|
        format.html { redirect_to feed_path, notice: "Post created." }
        format.turbo_stream
      end
    else
      redirect_to feed_path, alert: result.error
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
