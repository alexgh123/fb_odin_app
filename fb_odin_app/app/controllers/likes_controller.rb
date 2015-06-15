class LikesController < ApplicationController

  def create
    # post_id = params[:id]
    @like = post.likes.build(user_id: current_user.id)

    #post id should be included

      # Like.create(post_id:post.id, user_id:current_user.id)

    if @like.save
      flash[:success] = "you liked it!"
      redirect_to @post
    else
      flash[:danger] = "no idea what you are doing"
      redirect_to @post
    end

  end

  def destroy

  end

    private

    def likes_params
      #permit...
    end

end
