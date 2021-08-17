class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pokespot = Pokespot.find(params[:pokespot_id])
    authorize @booking
    if @booking.save
      flash[:notice] = "Booking confirmed, CATCH'EM ALL 😁😁😁"
      redirect_to pokespots_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
