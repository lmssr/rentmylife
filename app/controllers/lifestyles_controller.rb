class LifestylesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def new
    @lifestyle = Lifestyle.new
    authorize @lifestyle
  end

  def create
    @lifestyle = Lifestyle.new(lifestyle_params)
    authorize @lifestyle
    @lifestyle.user = current_user

   if  @lifestyle.save!
      current_user.save
      redirect_to lifestyles_path
    else
      render :new
    end
  end

  def show
    @lifestyle = Lifestyle.find(params[:id])
    @review = Review.new
    authorize @lifestyle
    if @lifestyle.reviews
      @reviews = @lifestyle.reviews
    end
  end

  def index
    @lifestyles = policy_scope(Lifestyle)
    @markers = @lifestyles.geocoded.map do |lifestyle|
      {
        lat: lifestyle.latitude,
        lng: lifestyle.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { lifestyle: lifestyle }),
        id: lifestyle.id
      }
    end
  end

  def destroy
    @lifestyle = Lifestyle.find(params[:id])
    authorize @lifestyle

    @lifestyle.destroy
    redirect_to lifestyles_path
  end

  private

  def lifestyle_params
    params.require(:lifestyle).permit(:name, :description, :price, :address, :photo, :photo_cache)
  end
end
