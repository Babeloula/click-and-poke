class PokespotsController < ApplicationController
  authorize @restaurant

  before_action :set_pokespot, only: [:edit, :update]

  def edit
  end

  def update
    @pokespot.update(pokespot_params)
    redirect_to pokespots_path(@pokespot)
  end

  private

  def set_pokespot
    @pokespot = Pokespot.find(params[:id])
  end
end
