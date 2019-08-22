class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  def dashboard
    @bookings = current_user.bookings
    @bookings_i_made = Booking.where(user: current_user)
  end
end
