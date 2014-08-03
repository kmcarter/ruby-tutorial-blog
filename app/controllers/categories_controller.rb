class CategoriesController < ApplicationController
	
	def index
		@categories = Category.all
	end
	
	def show
		if params[:id].nil?
			@category = Category.find_by slug: params[:slug]
		else
			@category = Category.find(params[:id])
		end
		#@articles = Article.find_by category_id: params[:id]
		@breadcrumbs = { @category.name => category_path_with_slug }
	end

	def new
		@category = Category.new
	end
	
	def create
		@category = Category.new(category_params)
		
 		if @category.save
			redirect_to @category
		else
			render 'new'
		end
	end
	
	def edit
		@category = Category.find(params[:id])
	end
	
	def update
		@category = Category.find(params[:id])

		if @category.update(category_params)
			redirect_to @category
		else
			render 'edit'
		end
	end
	
	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		redirect_to categories_path
	end
	
	# helpers ########################################
	
	def category_path_with_slug
		"/category/#{@category.slug}"
	end
	
	private ##########################################
	
	def category_params
		params.require(:category).permit(:name, :slug)
	end
end
