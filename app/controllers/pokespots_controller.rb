class PokespotsController < ApplicationController

  def new
    @pokespot = Pokespot.new
    authorize @pokespot
  end

 def create
    @pokespot = pokespot.new(pokespot_params)
    if @pokespot.save
      redirect_to pokespot_path(@pokespot)
    else
      render :new
    end
  end

  private

  def pokespot_params
    params.require(:pokespot).permit(:name, :description, :address, :price, :pokemon_type, :scarcity_drop_level)
  end
end
