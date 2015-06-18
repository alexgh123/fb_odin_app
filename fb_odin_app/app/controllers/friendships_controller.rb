class FriendshipsController < ApplicationController

  def create
    user = User.find(params[:friend_id])

  end

end


+  def create
+    user = User.find(params[:friend_id])
+    current_user.add_friend(user)
+    redirect_to user_path(user), notice: "You asked #{user.email} to be your friend"
+  end