require 'test_helper'

class InvolvementTest < ActiveSupport::TestCase
  def setup
    @involvement = books(:two).involvement.build user_id: users(:kyo).id
  end

  test "should be valid involvement" do
    assert @involvement.valid?
  end

  test "should have user" do
    @involvement.user_id = nil
    assert_not @involvement.valid?
  end

  test "should have book" do
    @involvement.book_id = nil
    assert_not @involvement.valid?
  end

end
