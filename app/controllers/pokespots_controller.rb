class PokespotsController < ApplicationController

  def show
    @pokespot = Pokespot.find(params[:id])
    authorize @pokespot
  end
end
