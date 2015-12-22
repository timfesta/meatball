class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
	end

	def create
		recipe = current_user.recipes(recipe_params)
		if recipe.save
			redirect_to recipe_path(recipe)
		else
			redirect_to new_recipe_path
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	private
	def recipe_params
		params.require(:recipe).require(:name, :description)	
	end
end


