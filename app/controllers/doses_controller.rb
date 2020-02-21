class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params_dose)
    # @restaurant = Restaurant.find(params['restaurant_id'])
    @dose.cocktail_id = params["cocktail_id"]
    @dose.ingredient_id = params[:dose][:ingredient_id]
    @dose.save
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def params_dose
    params['dose'].permit(:description, :cocktail_id)
  end
end
