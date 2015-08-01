require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end



  def setup
    @user = users(:user_one)
    @user.id = 3
    @other = users(:user_two)
  end



  test 'should redirect from index when not logged in' do
    get :index
    assert_redirected_to new_user_session_path
  end

  test 'should redirect from users show when not logged in' do
    get :show, id:@user
    assert_redirected_to new_user_session_path
  end

  # test 'current_user should return true when user is signed in' do
  #   sign_in @user
  #   current_user.should_not be_nil
  # end

  test 'should allow signed in user to see another user' do
    sign_in @user
    # byebug
    get :show, id:@other
    assert_response :success
  end

  # do i have a test for every controller? aka, should I have a test to ensure the path doesn't work, or do i just make sure there is no route to go to? would users ever want to see the friendships/1 for example?


  # has a profile/user show page

  # user index page can send friend requests


end
