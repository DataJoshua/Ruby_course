class ArticlesController < ApplicationController

  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def update

    if @article.update(article_params)
      flash[:notice] = "The article was updated"
      redirect_to article_path(@article) 
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "article destroyed"    
  end

  def new
    @article = Article.new
  end

  def create  
    @article = Article.new(article_params)
    if @article.save 
      flash[:notice] = "owo owo"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:name, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
