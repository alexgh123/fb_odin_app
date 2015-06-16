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

  def create
    @comment = current_user.comments.build(post_id: params[:post_id])
    if @comment.save
      flash[:success] = "comment created"
      redirect_to root_path
    else
      flash[:danger] = "cant comment"
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment Removed"
    redirect_to :back
  end


end
