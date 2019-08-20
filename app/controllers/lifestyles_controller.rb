class LifestylesController < ApplicationController

  def new
    @lifestyle = Lifestyle.new
  end

  def create
    @lifestyle = Lifestyle.new(lifestyle_params)
    @lifestyle.save
  end

  def show
    @lifestyle = Lifestyle.find(params[:id])
  end

  def index
    @lifestyles = Lifestyle.all
  end

  private

  def lifestyle_params
    params.require(:lifestyle).permit(:name, :description, :price)
  end
end

