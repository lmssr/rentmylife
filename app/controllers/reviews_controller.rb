class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
    @lifestyle = Lifestyle.find(params[:lifestyle_id])
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    if @review.save
      redirect_to lifestyle_path(current_user.lifestyle)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
  private
  def review_params
    params.require(:review).permit(:comment, :lifestyle_id)
  end
end
