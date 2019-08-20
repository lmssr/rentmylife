class UsersController < ApplicationController
  def article_params
    params.require(:users).permit(:first_name, :last_name, :email, :photo)
  end
end
