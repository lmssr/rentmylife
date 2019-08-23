class ReviewsController < ApplicationController
  # def new
  #   @review = Review.new
  #   authorize @review

  # end

  def create
    @lifestyle = Lifestyle.find(params[:lifestyle_id])
    @review = Review.new(review_params)
    authorize @review
    @review.lifestyle = @lifestyle
    @review.user = current_user
    # if @review.save
    #   redirect_to lifestyle_path(@lifestyle)
    # else
    #   render 'lifestyles/show'
    # end
    if @review.save
      respond_to do |format|
        format.html { redirect_to lifestyle_path(@lifestyle) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'lifestyles/show' }
        format.js  # <-- idem
      end
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
    params.require(:review).permit(:comment)
  end
end
