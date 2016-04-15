require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # include Devise::TestHelpers

  def setup
    @user = users(:leonhart)
  end

  test "should redirect index without login" do
    get users_path
    assert_redirected_to new_user_session_path
  end

  test "should redirect show without login" do
    get user_path(users(:leonhart))
    assert_redirected_to new_user_session_path
  end

  test "index should get home with login" do
    log_in_as @user
    get users_path
    assert_template 'users/index'
  end
 
end