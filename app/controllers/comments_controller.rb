class CommentsController < ApplicationController
  def new

  end

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article)
    # else
    #   @dose = Dose.new
    #   render "cocktails/show"
    # end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
