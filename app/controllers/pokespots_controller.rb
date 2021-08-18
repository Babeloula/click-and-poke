class PokespotsController < ApplicationController
  before_action :set_pokespot, only: [:edit, :update, :show, :destroy]

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
      render :new
    end
  end

  def index
    if params[:filter]
      @pokespots = policy_scope(Pokespot).where(pokemon_type: params[:filter])
    else
      @pokespots = policy_scope(Pokespot)
    end
        # the `geocoded` scope filters only Pokespots with coordinates (latitude & longitude)
    @markers = @pokespots.geocoded.map do |pokespot|
      {
        lat: pokespot.latitude,
        lng: pokespot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pokespot: pokespot }),
        image_url: helpers.asset_url('pokeball.png')
      }
    end
  end

  def show
    @booking = Booking.new
  end

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
          .permit(:name, :description, :address, :price, :pokemon_type, :scarcity_drop_level, :available, :user_id, :photo)
  end
end
