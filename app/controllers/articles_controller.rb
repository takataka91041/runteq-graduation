class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = current_user.articles.order(created_at: :desc)
  end

  def show; end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)

    ogp = OgpFetcher.fetch(@article.url)
    @article.og_title = ogp[:title]
    @article.og_image_url = ogp[:image]

    if @article.save
      redirect_to @article, notice: "記事を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "記事を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, notice: "記事を削除しました"
  end

  private

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :url, :learning_goal, :status, :priority,
      :estimated_reading_minutes, :output_memo, :implemented
    )
  end
end
