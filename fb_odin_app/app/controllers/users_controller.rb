class UsersController < ApplicationController

  #before action signin/authenticate!
  before_filter :authenticate_user!

  def index
    @array_of_pending_requested_users_ids = []

    current_user.sent_friendship_requests.where(user_2_status:"pending").each do |request|
      @array_of_pending_requested_users_ids << request.user_2_id
    end

    @second_array = []
    current_user.received_friendship_requests.where(user_2_status:"pending").each do |request|
      @second_array << request.user_1_id
    end

    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts#.paginate(page: params[:page])
    @comment = Comment.new
  end

end
