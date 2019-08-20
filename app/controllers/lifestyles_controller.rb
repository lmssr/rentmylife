class LifestylesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def new
    @lifestyle = Lifestyle.new
    authorize @lifestyle

  end

  def create
    @lifestyle = Lifestyle.new(lifestyle_params)
    @lifestyle.user = current_user
    authorize @lifestyle

    @lifestyle.save

    redirect_to lifestyles_path
  end

  def show
    @lifestyle = Lifestyle.find(params[:id])
    authorize @lifestyle
  end

  def index
    @lifestyles = policy_scope(Lifestyle)
  end

  def destroy

    @lifestyle = Lifestyle.find(params[:id])
    authorize @lifestyle

    @lifestyle.destroy


    redirect_to lifestyles_path
  end

  private

  def lifestyle_params
    params.require(:lifestyle).permit(:name, :description, :price)
  end
end
