class PlacesController < ApplicationController

  def show
    if params[:id].to_i == 0
      @place = Place.find_by(name: params[:id])
    else
      @place = Place.find(params[:id])
    end
  end

  def combat
    @place = Place.find(params[:place_id])
    @monsters = Monster.where("place_id = ?", params[:place_id])
    @characters = Character.where("place_id = ? AND user_id != ?", params[:place_id], current_user)
  end

  def engage
    @monster = Monster.find(params[:place][:monster_ids])
    @character = Character.where("user_id = ?", current_user.id).first
    @degats = @character.att - @monster.def
    @monster.stamina = @monster.stamina - @degats if @degats > 0
    @monster.save!
    redirect_to place_combat_path
  end


end


