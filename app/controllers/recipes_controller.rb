class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    5.times.each {|i| @recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # binding.pry
    # @recipe.ingredients.destroy_all(name: "")
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end
end
