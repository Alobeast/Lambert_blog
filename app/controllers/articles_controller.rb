class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
  params.require(:article).permit(:title, :text, :main_picture, :sub_picture1, :sub_picture_2, :sub_picture3, :sub_picture4 )
  end
end
