class ArticlesController < ApplicationController 
  
  before_action :set_article, only: [:show, :update, :edit, :destroy]
 
 def show
   # @article= Article.find(params[:id])
  end

  def index
    @articles=Article.all
  end

  def new 
    @article=Article.new
  end

  def edit
  #@article= Article.find(params[:id])   
  end

  def create
  @article=Article.new(article_params)#params.require(:article).permit(:title, :description))
  # render plain: @article.inspect 
  @article.user = User.first
  if @article.save
    flash[:notice] = "Article was save successfully"
      redirect_to @article
   else
    render 'new'
   end
  end
  
  def update
    #@article = Article.find(params[:id])
   if  @article.update(article_params)#params.require(:article).permit(:title, :description))
       flash[:notice] = "Article was update successfully"
      redirect_to @article
   else
    render 'edit'
   end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path 
  end
 
private 

def set_article
  @article = Article.find(params[:id])
end

def article_params
  params.require(:article).permit(:title, :description)
end




end
