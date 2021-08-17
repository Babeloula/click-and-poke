class ReviewsController < ApplicationController
  before_action :set_booking

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.booking_id = @booking.id
    authorize @review
    if @review.save
      redirect_to booking_path(@review)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review)
          .permit(:rating, :comment, :booking_id)
  end
end
