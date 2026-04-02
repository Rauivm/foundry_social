class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_character

  helper_method :current_character

  private

  def set_current_character
    return unless user_signed_in?

    @current_character = if session[:character_id].present?
      current_user.characters.find_by(id: session[:character_id])
    else
      current_user.characters.first
    end

    session[:character_id] = @current_character&.id
  end

  def current_character
    @current_character
  end
end
