class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end


  def create

    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to cocktails_path
  end

  def search
    # @cocktails = Cocktail.find(params["search"]["query"])
    @cocktail = Cocktail.find_by name: params['search']['query']
  end

  private

  def params_cocktail
    params['cocktail'].permit(:name, :photo)
  end
end
