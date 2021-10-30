class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    query = params[:q]
    @articles = query.present? ? Article.search(query) : Article.published

    render json:ArticleSerializer.new(@articles), status: :ok
  end

  def show
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: ArticleSerializer.new(@article), status: :ok
    else
      render json: { errors: @article.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: ArticleSerializer.new(@article), status: :ok
    else
      render json: { errors: @article.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :likes, :status)
  end
end
