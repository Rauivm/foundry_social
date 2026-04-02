class CharactersController < ApplicationController
  def index
    @characters = current_user.characters.order(created_at: :asc)
    @character = Character.new
  end

  def create
    @character = current_user.characters.build(character_params)

    if @character.save
      session[:character_id] = @character.id unless current_character
      redirect_to feed_path, notice: "Character created."
    else
      @characters = current_user.characters.order(created_at: :asc)
      render :index, status: :unprocessable_entity
    end
  end

  def switch
    character = current_user.characters.find_by(id: params[:character_id])
    return redirect_to(feed_path, alert: "Invalid character") unless character

    session[:character_id] = character.id
    redirect_back fallback_location: feed_path, notice: "Character switched."
  end

  private

  def character_params
    params.require(:character).permit(:name)
  end
end
