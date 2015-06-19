class FriendshipsController < ApplicationController

  def create
    Friendship.create(user_1_id: current_user.id, user_2_id: params[:friend_id], user_1_status: 'active', user_2_status: 'pending')
    redirect_to :back
    flash[:notice] = "request sent!"
  end

  def update
    Friendship.find(params[:id]).update_attributes(user_2_status:"active")
    flash[:success] = "Yay! Friendship"
    redirect_to :back
  end

  def destroy
    Friendship.find(params[:id]).destroy
    flash[:notice] = "you are a heartless bastard"
    redirect_to :back
  end

end



