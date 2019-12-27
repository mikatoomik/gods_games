class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @characters = Character.all
    @gods = God.all
    @places = Place.all
    @place = Place.last
    @character = Character.where("user_id = ?", current_user).last
    if @character.nil?
      @character = Character.new
    end
  end

end
