class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment Removed"
    redirect_to :back
  end

def create
  @comment = Comment.new(comment_params)


  @comment.save

  redirect_to root_path
end

def comment_params
  params.require(:comment).permit(:content, :user_id, :post_id)
end

end
