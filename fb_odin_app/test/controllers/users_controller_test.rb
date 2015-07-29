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

  test 'should allow signed in user to see another user' do
    sign_in @user
    get :show, id:@other
    assert_response :success
  end


end
