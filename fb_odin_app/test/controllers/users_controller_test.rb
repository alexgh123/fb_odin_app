require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:user_one)
  end

  test 'when not logged in, redirects to login page' do
    get :index
    assert_redirected_to new_user_session_path
  end

  test 'when not logged in, should redirect from users show ' do
    get :show, id: @user
    assert_redirected_to new_user_session_path
  end

  test 'when logged in, you do get list of users' do
    sign_in @user
    get :index
    assert_response :success
  end

  test 'when logged in, you can get a single user' do
    sign_in @user
    get :show, id: @user
    assert_response :success
  end


end
