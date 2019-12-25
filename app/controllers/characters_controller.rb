class CharactersController < ApplicationController

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(params_characters)
    @character.user = current_user
    @character.place = Place.find_by name: "zone"
    if @character.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @character = Character.where("user_id = ?", current_user).last
    @character.place = Place.find_by(name: params[:commit])
    if @character.save
      redirect_to character_path(@character)
    else
      redirect_to root_path
    end
  end

  private

  def params_characters
    params.require(:character).permit(:name, :god_id)
  end

end
