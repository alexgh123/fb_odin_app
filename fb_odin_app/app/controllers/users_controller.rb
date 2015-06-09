class UsersController < ApplicationController

  #before action signin/authenticate!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
