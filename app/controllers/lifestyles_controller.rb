class LifestylesController < ApplicationController
<<<<<<< HEAD

  skip_before_action :authenticate_user!, only: [:index]



=======
>>>>>>> 4092462114e70d7956459ede8608d05eb3d211e5
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
