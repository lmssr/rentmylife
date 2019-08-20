class BookingsController < ApplicationController
  def new
    # render the view page
    @booking = Booking.new
    authorize @lifestyle
    @lifestyle = Lifestyle.find(params[:lifestyle_id])
  end

  def create
    @booking = Booking.new(bookings_params)
    authorize @lifestyle
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @lifestyle
  end
  private
  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :lifestyle_id)
  end
end
