class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @article = Article.find(params[:id])
    authorize @article
    @comment = Comment.new
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article

    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    @article.update!(article_params)
    authorize @article

    if @article.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    redirect_to root_path
  end

  private
  def article_params
  params.require(:article).permit(:title, :text, :main_picture, :sub_picture1, :sub_picture_2, :sub_picture3, :sub_picture4 )
  end
end
