class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    if current_user.lifestyles.length >= 1
      @bookings = current_user.lifestyles.first.bookings
    else
      @bookings = []
    end
  end
end
