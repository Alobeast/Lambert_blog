class CommentsController < ApplicationController
  def new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article = @article
    @comment.user = current_user
    authorize @comment

    if @comment.save
    redirect_to article_path(@article)
    else
      raise
    #   @dose = Dose.new
    #   render "cocktails/show"
    end
  end

  def edit
  end

  def update
    authorize @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to article_path(@comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
