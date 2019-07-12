class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [ :create ]
  def create
    @ingredient =Ingredient.new
    @dose = Dose.new
    @review = Review.new(review_params)
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end

  end

  def destroy
    @review = Review.find(params["id"])
    @review.destroy
    redirect_to cocktail_path(@review.cocktail)
  end

  def review_params
    params.require("review").permit(:content, :rating)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params["cocktail_id"])
  end

end
