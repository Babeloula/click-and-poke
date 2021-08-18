class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]

  def show
  end

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

  def update
    if params[:status] == "Accepted"
      @booking.status_Accepted!
    else
      @booking.status_Declined!
    end
    redirect_to dashboard_path
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
