require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @user = users(:user_one)
    @post = posts(:post_one)
    @user.posts << posts(:post_one)
  end

  test 'when not logged in, should redirect from posts index' do
    get :index
    assert_redirected_to new_user_session_path
  end

  test 'when not logged in, should redirect from posts show ' do
    get :show, id:@post
    assert_redirected_to new_user_session_path
  end

  test 'when logged in, should get home page/posts index' do
    sign_in @user
    get :index
    assert_response :success
  end

  test 'when logged in, should get posts show ' do
    sign_in @user
    get :show, id:@post
    assert_response :success
  end



end
