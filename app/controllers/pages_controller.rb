class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @characters = Character.all
    @gods = God.all
    @places = Place.all
  end
end
