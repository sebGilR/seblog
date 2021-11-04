class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    query = params[:q]
    @articles = query.present? ? Article.search(query) : Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end
  
  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      flash.now[:alert] = @article.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      flash.now[:alert] = @article.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :likes, :status)
  end
end
