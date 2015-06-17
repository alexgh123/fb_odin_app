class PostsController < ApplicationController

  before_filter :authenticate_user!

  include PostsHelper

  def index
    @posts = Post.where(user_id: people_I_follow_ids)
    @comment = Comment.new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "you created a post!"
      redirect_to @post
    else
      render 'new'
    end
  end

      private

      def post_params
        params.require(:post).permit(:content, :user_id)
      end

end
