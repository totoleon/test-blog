class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end 

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    # The render method here is taking a very simple hash with a key of plain and value 
    # of params[:article].inspect. The params method is the object  which represents the 
    # parameters coming in from the form The params method returns an 
    # ActiveSupport::HashWithIndefferentAccess 

    # When the form is submitted, it comes with the values filled in, which includes
    # :title and :text

    # @article = Article.new(params[:article])
    @article = Article.new(article_params)
    # Require permission for certain parameters for this object.

    if @article.save
      redirect_to @article
    else 
      render  'new'  
    end
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

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
