class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @articles = Article.where(sold: false)
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    @article.vendor_id = current_user.id

    if @article.save 
      redirect_to article_path(@article), notice: "Ton article a été ajouté !"
    else 
      render :new
    end
  end

  private

  def articles_params
    params.require(:article).permit(:name, :description, :price)
  end

end
