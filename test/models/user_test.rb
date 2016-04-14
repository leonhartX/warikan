require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user should has name" do
    user = User.new
    assert_not user.valid?
  end

  test "user shuold have email" do
    user = User.new name: "leonhart"
    assert_not user.valid?
  end

  test "valid user" do
  	user = users(:leonhart)
  	assert user.valid?
  end

end
