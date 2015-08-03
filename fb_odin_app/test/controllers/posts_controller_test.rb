require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @user = users(:user_one)
  end

  test 'should redirect from posts index when not logged in' do
    get :index
    assert_redirected_to new_user_session_path
  end

  test 'should redirect from posts show when not logged in' do
    get :show, id:1
    # byebug
    assert_redirected_to new_user_session_path
  end



end
