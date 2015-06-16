class LikesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    @like = current_user.likes.build(post_id: params[:post_id])
    #post id should be included
      # Like.create(post_id:post.id, user_id:current_user.id)
    if @like.save
      flash[:success] = "you liked it!"
      redirect_to root_path
    else
      flash[:danger] = "no idea what you are doing"
      redirect_to @post
    end

  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:notice] = "Removed Like."
    redirect_to :back
  end

    private

    def likes_params
      #permit...
    end

end
