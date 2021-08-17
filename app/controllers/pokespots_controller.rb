class PokespotsController < ApplicationController
  authorize @restaurant

  def show
    @pokespot = Pokespot.find(params[:id])
  end

end
