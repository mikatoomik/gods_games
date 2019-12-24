class PlacesController < ApplicationController

  def show
    if params[:id].to_i == 0
      @place = Place.find_by(name: params[:id])
    else
      @place = Place.find(params[:id])
    end
  end

end

