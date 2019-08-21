class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def new
    # render the view page
    @booking = Booking.new
    authorize @booking
    @lifestyle = Lifestyle.find(params[:lifestyle_id])
  end

  def create
    @booking = Booking.new(bookings_params)
    authorize @booking
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params["booking"]["status"]
    @booking.save
    redirect_to dashboard_path(@booking.user)
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :lifestyle_id)
  end
end

