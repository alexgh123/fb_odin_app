require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end



  def setup
    @user = users(:user_one)
    @other = users(:user_two)
  end

  test 'should redirect from index when not logged in' do
    get :index
    assert_redirected_to new_user_session_path
  end


end
