class PokespotsController < ApplicationController
  def index
    @pokespots = policy_scope(Pokespot)
  end

  # def show
  #   @pokespot = Pokespot.find(params[:id])
  #   authorize @pokespot
  # end
end
