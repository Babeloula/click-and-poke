class PokespotsController < ApplicationController

  def new
    @pokespot = Pokespot.new
    authorize @pokespot
  end

 def create
    @pokespot = Pokespot.new(pokespot_params)
    @pokespot.user = current_user
    authorize @pokespot
    if @pokespot.save
      redirect_to pokespot_path(@pokespot)
    else
      raise
      render :new
    end
  end

  private

  def pokespot_params
    params.require(:pokespot).permit(:name, :description, :address, :price, :pokemon_type, :scarcity_drop_level, :photo)
  end
end
