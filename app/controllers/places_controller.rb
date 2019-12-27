class PlacesController < ApplicationController

  def show
    if params[:id].to_i == 0
      @place = Place.find_by(name: params[:id])
    else
      @place = Place.find(params[:id])
    end
  end

  def engage
    @place = Place.find(params[:place_id])
    @monsters = Monster.where("place_id = ?", params[:place_id])
    @characters = Character.where("place_id = ? AND user_id != ?", params[:place_id], current_user)
  end

  def combat
    @place = Place.find(params[:place_id])
    @monsters = Monster.where("place_id = ?", params[:place_id])
    monster = Monster.find(params[:place][:monster_ids])
    @character = Character.where("user_id = ?", current_user.id).first
    character_att(@character, monster)
    combat_result(@character, monster)
    if @result == "Il est mort"
      return
    else
      monster_att(@monsters, @character)
    end
  end

  def character_att(character, monster)
    degats = character.att - monster.def
    monster.stamina = monster.stamina - degats if degats > 0
    monster.save!
    @degats = "Vous infligez #{degats} dégats au #{monster.name}"
  end

  def monster_att(monsters, character)
    puissance = 0
    @monsters.each do |monster|
      puissance += monster.att
    end
    degats = puissance - character.def
    character.stamina = character.stamina - degats if degats > 0
    character.save!
    @blessures = "Vous avez subit #{degats} points de blessures"
  end

  def combat_result(character, monster)
    if character.stamina <= 0
      redirect_to root_path
    elsif
      monster.stamina <= 0
      monster.destroy
      @result = "Il est mort"
    else
      @result = "Il lui reste #{monster.stamina} points de vie"
    end
  end
end


