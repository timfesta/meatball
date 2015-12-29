class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
		render :new
	end

	def create
		recipe = current_user.recipes.new(recipe_params)
		if recipe.save
			redirect_to recipe_path(recipe)
		else
			redirect_to new_recipe_path
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		recipe = Recipe.find(params[:id])
		recipe.update_attributes(recipe_params)
		redirect_to recipe_path(recipe)
	end

	private
	def recipe_params
		params.require(:recipe).permit(:name, :instructions)	
	end
end


