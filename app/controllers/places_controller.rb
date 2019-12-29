class PlacesController < ApplicationController
  before_action :set_character, only: [:engage, :combat, :fuir]
  before_action :set_monsters, only: [:engage, :fuir]

  def show
    if params[:id].to_i == 0
      @place = Place.find_by(name: params[:id])
    else
      @place = Place.find(params[:id])
    end
  end

  def engage
    @place = Place.find(params[:place_id])
    @characters = Character.where("place_id = ? AND user_id != ?", params[:place_id], current_user)
  end

  def combat
    @place = Place.find(params[:place_id])
    @monsters = Monster.where("place_id = ?", params[:place_id])
    if params[:place][:monster_ids] != ""
      monster = Monster.find(params[:place][:monster_ids])
      character_att(@character, monster)
      combat_result(@character, monster)
      if @result == "Il est mort"
        return
      else
        monster_att(@monsters, @character)
      end
    else
      adv = Character.find(params[:place][:character_ids])
      character_att(@character, adv)
      combat_result(@character, adv)
      if @result == "Il est mort"
        return
      else
        adversaires = [adv]
        monster_att(adversaires, @character)
      end
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
    monsters.each do |monster|
      puissance += monster.att
    end
    degats = puissance - character.def
    character.stamina = character.stamina - degats if degats > 0
    character.save!
    @blessures = "Vous avez subit #{degats} points de blessures"
  end

  def combat_result(character, monster)
    if character.stamina <= 0
      character.stamina = 100
      character.save
      redirect_to root_path
    elsif
      monster.stamina <= 0
      monster.destroy
      @result = "Il est mort"
    else
      @result = "Il lui reste #{monster.stamina} points de vie"
    end
  end

  def fuir
      @character.place = Place.find_by(name: @character.place.links.sample)
      @character.stamina = @character.stamina / 2
      @character.save
      @monsters.each do |monster|
        MvntMonsterJob.perform_later(monster.id)
      end
      redirect_to character_path(@character)
  end

  private

  def set_character
    @character = Character.where("user_id = ?", current_user.id).last
  end
  def set_monsters
    @monsters = Monster.where("place_id = ?", params[:place_id])
  end
end


