class BookingsController < ApplicationController
  def new
    # render the view page
    @booking = Booking.new
  end

  def create
    @life = Lifestyle.find(params[:lifestyle_id])
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.life = @life
    if @booking.save
      redirect_to bookings_path(@life)
    else
      render :new
    end
  end


  private
  def bookings_params
    params.require(:booking).permit(:name, :description)
  end
end
