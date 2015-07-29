require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get sign in page" do
    get :sign_in
    assert_response :success
  end


end
