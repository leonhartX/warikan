require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid user" do
    @user = User.new name: "leonhart"
    assert @user.valid?
  end

  test "user should has name" do
  	@user = User.new
  	assert_not @user.valid?
  end

end
