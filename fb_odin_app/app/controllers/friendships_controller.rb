class FriendshipsController < ApplicationController

  def create

    Friendship.create(user_1_id: current_user.id, user_2_id: params[:friend_id], user_1_status: 'active', user_2_status: 'pending')

    redirect_to :back
  end

end



