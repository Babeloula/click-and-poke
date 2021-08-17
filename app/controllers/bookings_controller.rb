class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pokespot = Pokespot.find(params[:pokespot_id])
    authorize @booking
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
