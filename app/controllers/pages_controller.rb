class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @characters = Character.all
    @gods = God.all
    @places = Place.all
    place = Place.last
    combat_init(place)
    combat_result(@advs)
  end

  def combat_init(place)
    @adv1 = Character.where("place_id = ?", place).first
    @adv2 = Character.where("place_id = ?", place).last
    @advs = [@adv1, @adv2]
  end

  def combat_result(advs)
    @winner = advs.sample
  end
end
