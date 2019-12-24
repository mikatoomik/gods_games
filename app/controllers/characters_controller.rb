class CharactersController < ApplicationController

  def show
    @character = Character.where("user_id = ?", current_user).last
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(params_characters)
    @character.user = current_user
    @character.place = "zone"
    if @character.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def params_characters
    params.require(:character).permit(:name, :god_id)
  end

end
