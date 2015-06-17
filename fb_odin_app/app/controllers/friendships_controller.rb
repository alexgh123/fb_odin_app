class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]
  #can only edit if Friendship.user_id = current_user.id

  #just say unless you are an admin, you can't mess with this



  # GET /friendships
  # GET /friendships.json
  def index
    if current_user.admin?
      @friendships = Friendship.all
    else
      @friendships = Friendship.all.where(user_id:current_user.id)
    end
  end

  # User.where(weekly_subscriber: true).find_each do |user|
  # NewsMailer.weekly(user).deliver_now
# end

  # # GET /friendships/1
  # # GET /friendships/1.json
  def show
  end
  #^ anybody can see any friendship, and edit it, random people could determine who your friends are...that is bad

  # # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json


  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id], approved: "false")
      if @friendship.save
        flash[:notice] = "Friend requested."
        redirect_to current_user
      else
        flash[:error] = "Unable to request friendship."
        redirect_to current_user
      end
    end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
    @friendship.update(approved: true)
    if @friendship.save
      redirect_to :back, :notice => "Successfully confirmed friend!"
    else
      redirect_to :back, :notice => "Sorry! Could not confirm friend!"
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json


  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :approved)
    end
end
