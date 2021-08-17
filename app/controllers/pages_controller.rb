class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @bookings = current_user.bookings
    @clients_booking = current_user.clients_booking
  end

  def update
    @booking.update(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
