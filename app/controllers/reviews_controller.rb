class ReviewsController < ApplicationController
  before_action :set_booking

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = @booking.id
    authorize @review
    if @review.save
      redirect_to booking_path(@booking)
    else
      flash[:notice] = "Something went wrong... Please try again! 👍"
      redirect_to booking_path(@booking)
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review)
          .permit(:rating, :comments, :booking_id)
  end
end
