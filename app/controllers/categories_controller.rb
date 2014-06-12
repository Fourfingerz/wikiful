class CategoriesController < ApplicationController

	#lists all article categories by alphabetical order ascending
	def index
		@categories = Category.all.order(name: :desc)
	end

	#takes to a separate page and lists all articles within that category
	def show
		@category = Category.find(params[:id])
	end

end	

