class ViewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create show]

  def new
    # tenho de passar para o formulário a id do restaurant
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    # @review.restaurant_id = @restaurant.id
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end