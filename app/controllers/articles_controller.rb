class ArticlesController < ApplicationController
	#http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@category = Category.find(@article.category_id) unless @article.category_id.nil?
		@breadcrumbs = @category.nil? ? { @article.title => article_path(@article) } : { @category.name => category_path(@category), @article.title => article_path(@article) }
	end
	
	def search
		#Person.where(["name LIKE '%?'", name]).take
		@articles = Article.where(["title LIKE :q or text LIKE :q", { q: "%#{params[:q]}%" }]) 
	end

	def new
		@article = Article.new
	end
	
	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		
 		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end
	
	private ##########################################
	
	def article_params
		params.require(:article).permit(:title, :text, :category_id)
	end
end
