class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    if current_user.lifestyle != nil
      @bookings = current_user.lifestyle.bookings
    else
      @bookings = []
    end
  end
end
