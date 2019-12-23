class CharactersController < ApplicationController

  def show
    @character = Character.find_by("user_id" == current_user.id)
  end

end
