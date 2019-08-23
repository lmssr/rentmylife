class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  def dashboard
    @accepted_bookings = current_user.bookings.where(status: "accepted")
    @pending_bookings = current_user.bookings.where(status: "pending")
    @bookings_i_made = Booking.where(user: current_user)
  end
end
