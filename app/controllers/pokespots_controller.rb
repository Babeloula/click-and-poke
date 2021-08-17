class PokespotsController < ApplicationController

  before_action :set_pokespot, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    @pokespot.update(pokespot_params)
    redirect_to pokespots_path(@pokespot)
  end

  def destroy
    @pokespot.destroy
    redirect_to pokespots_path
  end

  private

  def set_pokespot
    @pokespot = Pokespot.find(params[:id])
    authorize @pokespot
  end

  def pokespot_params
    params.require(:pokespot)
          .permit(:name, :description, :address, :price, :pokemon_type, :scarcity_drop_level, :available, :user_id)
  end
end
