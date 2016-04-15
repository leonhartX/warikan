require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:leonhart)
  end

  test "valid user" do
    assert @user.valid?
  end

  test "user should has name" do
    user = User.new email: "leonhart@exmaple.com"
    assert_not user.valid?
  end

  test "user shuold have email" do
    user = User.new name: "leonhart"
    assert_not user.valid?
  end

  test "name should begin with alphabet" do
    @user.name = "1leonhart"
    assert_not @user.valid?
  end

  test "name can has number" do
    @user.name = "leon2hart"
    assert @user.valid?
  end

  test "name should not have special chars" do
    @user.name = "l$e%o^n&h*a(r@t"
    assert_not @user.valid?
  end

  test "name can has hyphen and underscore" do
    @user.name = "leon_hart-"
    assert @user.valid?
  end

end
